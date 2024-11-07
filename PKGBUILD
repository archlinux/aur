# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
pkgver=6.11.1
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url=https://codeberg.org/pf-kernel/uksmd
license=(GPL-3.0-or-later)
arch=(x86_64)
depends=(systemd procps-ng libcap-ng)
optdepends=('uksmdstats: for parsing /sys KSM statistics')
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('a9058bd65730cd80d9b8ae7f22556f4b0c1d3c0ae421315208f13178e34dfdc2')

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
