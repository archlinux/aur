# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
pkgver=6.12.2
pkgrel=2
pkgdesc="Userspace KSM helper daemon"
url=https://codeberg.org/pf-kernel/uksmd
license=(GPL-3.0-or-later)
arch=(x86_64)
depends=(systemd procps-ng libcap-ng)
optdepends=('uksmdstats: for parsing /sys KSM statistics')
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('1009f73deeafcf115336885ddff21090d0b77c32d1e4cec3d035474b37baf6ff')

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
