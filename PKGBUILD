# Maintainer: David Runge <dave@sleepmap.de>
pkgname=non-sequencer
pkgver=1.9.5
pkgrel=2
pkgdesc="A powerful, lightweight, real-time, pattern-based MIDI sequencer"
arch=('x86_64')
url="https://non.tuxfamily.org/"
license=('GPL3')
groups=('non-daw' 'pro-audio')
depends=('hicolor-icon-theme' 'jack' 'liblo' 'libsigc++' 'ntk')
makedepends=('python')
source=("$pkgname-$pkgver.tar.gz::https://git.tuxfamily.org/non/non.git/snapshot/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('1c7537586671293c6f4463f00a6848d3ae5528aabbea82084b9b82e043790bebcea5ec877cacd88c31a953807a19db4b4027ad763a1f869e0725e677a89d2162')

prepare() {
  mv -v "${pkgname}-v${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  ./waf configure --prefix=/usr --project=sequencer
  ./waf
}

package() {
  cd "$pkgname-$pkgver"
  ./waf --destdir="${pkgdir}" install
}
