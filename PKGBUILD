# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=boca
_pkgname=BoCA
pkgver=1.0.6a
pkgrel=1
epoch=1
pkgdesc="A component library used by the fre:ac audio converter"
arch=('x86_64')
url="https://github.com/enzo1982/BoCA"
license=('GPL2')
depends=('alsa-lib' 'libcdio-paranoia' 'expat' 'libpulse' 'uriparser' 'smooth')
provides=('libboca-1.0.so=3' 'freac_cdk')
conflicts=('freac_cdk')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a58fe081f210b6e9ab2ad15dcd2b76d7708a98d307f088d8ac5dc1bfa250a749')

prepare() {
  cd "$_pkgname-$pkgver"
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;

  sed -i 's/FOLDERS += coreaudioconnect/#FOLDERS += coreaudioconnect/g' \
    components/encoder/Makefile
}

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
