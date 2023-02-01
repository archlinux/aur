# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_rev=39dacdc9ed35effb713f8ecd426aeaa8e5a2a6f3
pkgver=0.0.0.r17.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url=https://codeberg.org/pf-kernel/uksmd
license=(GPL3)
arch=(x86_64)
depends=(systemd procps-ng libcap-ng)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${_rev}.tar.gz)
sha256sums=('2a9d592172e3be58cd3375b09bd4e10708a38f7258172aa35c7e608652edf370')

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

