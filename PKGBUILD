# Maintainer: Mikkel Kroman <mk@maero.dk>

pkgname=antumbra-beta
pkgver=0.1.1.beta.r0.g09338d6
_pkgver=0.1.1
pkgrel=1
pkgdesc="Protocol library and tools for the Antumbra Glow"
arch=('x86_64')
url="https://github.com/TeamAntumbra/libantumbra"
license=('GPL3')
depends=('libusb')
makedepends=('pkg-config')
source=("${pkgname}::git+https://github.com/TeamAntumbra/libantumbra.git#tag=${_pkgver}-beta"
        "glow-udev.rules")
sha256sums=('SKIP'
            '58d51d2cf4b0df88dd6aa332fc5d63552ac1582af19d549cfcd30a3dcfe6389c')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
  make os=linux libantumbra.so
  make os=linux antumbratool
}

package() {
  install -Dm644 glow-udev.rules "${pkgdir}/usr/lib/udev/rules.d/40-antumbra-glow.rules"

	cd "${srcdir}/${pkgname}"
  install -Dm755 libantumbra.so "${pkgdir}/usr/lib/libantumbra.so"
  install -Dm755 antumbratool "${pkgdir}/usr/bin/antumbratool"
}
