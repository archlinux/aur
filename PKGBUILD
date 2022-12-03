# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>
# Contributor: this.ven <misgi@ven.uber.space>

pkgname=clap
pkgver=1.1.3
pkgrel=1
pkgdesc='Clever Audio Plugin API'
arch=(any)
url='https://cleveraudio.org'
license=(MIT)
groups=(pro-audio)
depends=()
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/free-audio/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('025bdb0fcaee9470218fcc295c5d08604da42e3eb51e13320fa742eaf2edf2db')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd $pkgname-$pkgver
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
