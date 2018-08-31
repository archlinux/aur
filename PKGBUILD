# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=ngmlr
pkgver=0.2.7
pkgrel=1
pkgdesc="Long-read mapper designed to align PacBio or Oxford Nanopore to reference genomes"
arch=('x86_64')
url="https://github.com/philres/$pkgname"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/philres/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('f4eea67dd3e02d278ef586317b478841')

build() {
  cd "$pkgname-$pkgver"
  cmake \
    -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev \
    .
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dpm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
