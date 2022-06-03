# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on aur/uksmd by
# Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd-git
_repouser=post-factum
_reponame=uksmd
pkgver=0.0.0.r31.e9b06f4
pkgrel=1
pkgdesc="Userspace KSM helper daemon (git version)"
url="https://gitlab.com/post-factum/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(UKSMD-BUILTIN systemd procps-ng libcap-ng)
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
	cd "${_reponame}"

	meson install -C build --destdir "${pkgdir}"
}
