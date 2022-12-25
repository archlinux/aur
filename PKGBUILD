# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Dan Campbell <dan at compiledworks dot com>
# Contributor: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Jan Hambrecht <jaham at gmx dot net>

pkgname=spacenavd
pkgver=1.2
pkgrel=1
pkgdesc='Free user-space driver for 6-dof space-mice (space navigator, space pilot, space traveller, ...)'
arch=('x86_64')
url='https://spacenav.sourceforge.net/'
license=('GPL3')
makedepends=("libx11")
backup=('etc/spnavrc')
source=("https://github.com/FreeSpacenav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "spacenavd.service")
sha256sums=('94f28b56dcdb9e9439ea51a06fb1aae3ab5c5db3ca532d188c6d77d2148cc575'
            'aeb15629aba253b76205e9a50dbc54fe35df5ab6b25a25da16ecb7f261e587d5')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/spacenavd.service $pkgdir/usr/lib/systemd/system/spacenavd.service
  install -D -m644 $srcdir/$pkgname-$pkgver/doc/example-spnavrc $pkgdir/etc/spnavrc
}
