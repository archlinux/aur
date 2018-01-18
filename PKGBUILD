# Maintainer:  David Runge <dave@sleepmap.de>
# Contributor:  Joakim Hernberg <jhernberg at alchemy dot lu>

pkgname=zita-njbridge
pkgver=0.4.1
pkgrel=2
pkgdesc="Jack client to transmit audio over a local IP network."
url="https://kokkinizita.linuxaudio.org/linuxaudio/"
arch=('x86_64')
license=('GPL3')
depends=('jack' 'zita-resampler')
source=("https://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
sha512sums=('b48fc7c12e0b261290175ef6e20728922d19b12318a31b2ee03fd3e388b61c6c28d99d5c8990442ecc8884a2dab7b4585100549f553ee81d5ff4d069909b96df')

build() {
  cd "${pkgname}-${pkgver}/source"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}/source"

  install -t "${pkgdir}/usr/bin/" -Dm755 zita-j2n -Dm755 zita-n2j
  install -t "${pkgdir}/usr/share/man/man1" -Dm644 zita-njbridge.1.gz \
    -Dm644 zita-j2n.1.gz -Dm644 zita-n2j.1.gz
  install -Dm 644 ../AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm 644 ../README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
