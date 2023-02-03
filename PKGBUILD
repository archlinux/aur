# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_rev=1e5c7b258ba8f6946cd4a282d5911d3b02988f18
pkgver=0.0.0.r18.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url=https://codeberg.org/pf-kernel/uksmd
license=(GPL3)
arch=(x86_64)
depends=(systemd procps-ng libcap-ng)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${_rev}.tar.gz)
sha256sums=('837cd8a02943e48dc42a1c3ec422bcbf915c59fa86539886da5242a489b732aa')

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

