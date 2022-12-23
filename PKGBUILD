# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on aur/uksmd by
# Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd-git
_pkgname=uksmd
pkgver=0.0.0.r40.8f0349e
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
pkgdesc+=" (git version)"
url=https://codeberg.org/pf-kernel/uksmd
license=(GPL3)
arch=(x86_64)
depends=(systemd procps-ng libcap-ng)
makedepends=(meson)
makedepends+=(git)
source=(${pkgname}::git+${url}.git)
sha256sums=('SKIP')
conflicts=(${_pkgname})
provides=(${_pkgname})

pkgver() {
	cd ${pkgname}
	printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${pkgname}

	arch-meson . build

	meson compile -C build
}

package() {
	depends+=(UKSMD-BUILTIN)

	cd ${pkgname}

	meson install -C build --destdir "${pkgdir}"
}

