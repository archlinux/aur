# Maintainer: Det <nimetonmaili g-mail>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=npapi-vlc
pkgver=2.2.1
pkgrel=1
pkgdesc="The modern VLC Mozilla (NPAPI) plugin"
arch=('i686' 'x86_64')
url="http://git.videolan.org/?p=$pkgname.git;a=summary"
depends=('vlc')
makedepends=('gtk2' 'npapi-sdk')
options=('!libtool')
# This package uses version tags from Git, because there are no official releases
source=(git://git.videolan.org/$pkgname.git#tag=$pkgver)
md5sums=('SKIP')

build() {
  cd $pkgname

  msg2 "Starting autogen.sh..."
  sh ./autogen.sh

  msg2 "Starting configure..."
  ./configure --prefix=/usr

  msg2 "Starting make..."
  make
}

package() {
  cd $pkgname

  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}