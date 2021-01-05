# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=lzlib
pkgver=1.12
pkgrel=1
pkgdesc="A library providing in-memory LZMA compression and decompression functions"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lzip/lzlib.html"
license=('GPL3')
depends=('gcc-libs')
options=('!emptydirs')
source=(http://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz
sha256sums=('8e5d84242eb52cf1dcc98e58bd9ba8ef1aefa501431abdd0273a22bf4ce337b1'
            'SKIP')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm755 minilzip "${pkgdir}"/usr/bin/minilzip
}
