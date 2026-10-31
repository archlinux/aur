# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Dan Campbell <dan at compiledworks dot com>
# Contributor: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Jan Hambrecht <jaham at gmx dot net>

pkgname=spacenavd
pkgver=1.4
pkgrel=1
pkgdesc='Free user-space driver for 6-dof space-mice'
arch=('x86_64')
url='https://spacenav.sourceforge.net/'
license=('GPL-3.0-or-later')
depends=("libx11" "libxext")
backup=('etc/spnavrc')
source=("https://github.com/FreeSpacenav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "spacenavd.service")
sha256sums=('de57c7e16520c0ae6fa123108231d316aab69a74c1b2ee46972cfd4a3b0c43e0'
            '8ec0531f98dabde894412c3e5d60870f776ed546c11873f190ea6f7ccf6ad956')

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
