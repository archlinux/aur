# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on aur/uksmd by
# Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd-git
_reponame=uksmd
pkgver=0.0.0.r37.f10f38e
pkgrel=1
pkgdesc="Userspace KSM helper daemon (git version)"
url="https://codeberg.org/pf-kernel/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(systemd procps-ng libcap-ng)
makedepends=(meson)
makedepends+=(git)
source=(${_reponame}::git+${url}.git)
sha256sums=('SKIP')
conflicts=("${_reponame}")
provides=("${_reponame}")

pkgver() {
  cd "${_reponame}"
  printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_reponame}"

	arch-meson . build

	meson compile -C build
}

package() {
	depends+=(UKSMD-BUILTIN)
	cd "${_reponame}"

	meson install -C build --destdir "${pkgdir}"
}
