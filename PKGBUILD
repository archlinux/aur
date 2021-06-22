# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Matt Harrison <matt at mistbyte dot com>
# Contributor: Muhammad Qadri <Muhammad dot A dot Qadri at gmail dot com>

pkgname=julius
pkgver=4.6
pkgrel=3
pkgdesc='A high-performance, two-pass large vocabulary continuous speech recognition decoder software'
arch=('x86_64')
url='https://github.com/julius-speech/julius'
license=('custom')
depends=('libpulse' 'sdl2' 'perl')
optdepends=('voxforge-am-julius: Acoustic models')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/julius-speech/julius/archive/v${pkgver}.tar.gz")
sha256sums=('74447d7adb3bd119adae7915ba9422b7da553556f979ac4ee53a262d94d47b47')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-words-int \
    --enable-msd \
    --enable-gmm-vad \
    --enable-decoder-vad \
    --enable-power-reject \
    --enable-wpair

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
