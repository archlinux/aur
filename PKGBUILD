# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=zita-ajbridge
pkgver=0.7.0
pkgrel=2
pkgdesc="Jack client to use additional ALSA devices."
arch=('x86_64')
url="https://kokkinizita.linuxaudio.org/linuxaudio/zita-ajbridge-doc/quickguide.html"
license=('GPL3')
depends=('jack' 'zita-resampler' 'zita-alsa-pcmi')
source=("https://kokkinizita.linuxaudio.org/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('1b875bf1b9dfb8e9284af2ae03b6a6f82ad1cbe06eb24faa8485ac0db52f914cdc1a7447b1e9d46a42fb634848a2ee7904c658180f84cf4db210db59478a4806')

build() {
  cd "${pkgname}-${pkgver}/source"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}/source"

  install -t "${pkgdir}/usr/bin" -Dm 755 zita-a2j -Dm 755 zita-j2a

  install -t "${pkgdir}/usr/share/man/man1" -Dm644 zita-ajbridge.1.gz \
    -Dm644 zita-a2j.1.gz -Dm644 zita-j2a.1.gz
  install -Dm644 ../AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 ../README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
# vim:set ts=2 sw=2 et:
