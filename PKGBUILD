# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
pkgver=6.12.2
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url=https://codeberg.org/pf-kernel/uksmd
license=(GPL-3.0-or-later)
arch=(x86_64)
depends=(systemd procps-ng libcap-ng)
optdepends=('uksmdstats: for parsing /sys KSM statistics')
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('c5ff9358cd1a4a68fccebbc20e7eb82616e7bb9bf57041152395d6f9cf8a1795')

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
