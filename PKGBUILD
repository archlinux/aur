# Maintainer: Mikkel Kroman <mk@maero.dk>

pkgname=libantumbra
pkgver=1.0.1
pkgrel=1
pkgdesc="Protocol library and tools for the Antumbra Glow"
arch=('x86_64')
url="https://github.com/TeamAntumbra/libantumbra"
license=('GPL3')
depends=('libusb')
makedepends=('pkg-config')
source=("https://github.com/TeamAntumbra/libantumbra/archive/${pkgver}.tar.gz"
        'glow-udev.rules')
sha256sums=('26f7db6325fe20d6feb3a895b5c0dd2af25eb2e5faab57ca3bf411e48dbc16fe'
            'f80a3d303b6c035c01f872a4f932724191ef867a950a07c15b88c75ccef6c8da')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  make os=linux libantumbra.so
  make os=linux antumbratool
}

package() {
  install -Dm644 glow-udev.rules "${pkgdir}/usr/lib/udev/rules.d/40-antumbra-glow.rules"

	cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 libantumbra.so "${pkgdir}/usr/lib/libantumbra.so"
  install -Dm755 antumbratool "${pkgdir}/usr/bin/antumbratool"
}
