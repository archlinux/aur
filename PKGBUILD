# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Matt Harrison <matt at mistbyte dot com>
# Contributor: Muhammad Qadri <Muhammad dot A dot Qadri at gmail dot com>

pkgname=julius
pkgver=4.6
pkgrel=2
pkgdesc="A high-performance, two-pass large vocabulary continuous speech recognition decoder software"
arch=("x86_64")
url="http://julius.sourceforge.jp/"
license=("custom")
depends=("libpulse" "sdl2" "perl")
optdepends=("voxforge-am-julius: acoustic models")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/julius-speech/julius/archive/v${pkgver}.tar.gz")
sha512sums=('431aa3693f7fa3cbc8e9aa429c3e2011d1dde8db9510f14e81516061c8348cdf0f48bf585c0feeb12ad7aceb25d270fb6890131e746fb1a6f7cc0d8514bd30e4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  ./configure \
    --prefix="/usr/" \
    --mandir='${prefix}/share/man'\
    --enable-words-int \
    --enable-msd \
    --enable-gmm-vad \
    --enable-decoder-vad \
    --enable-power-reject \
    --enable-wpair
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"

  # leave static libraries since julius does not support
  # shared ones at the moment. See also FS#50599
  make prefix="${pkgdir}/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/julius/LICENSE"
}

# vim:set ts=2 sw=2 et:

