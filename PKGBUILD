# Maintainer: whoami <whoami@systemli.org>
# Contributor: Robert Holt <holt.r94 at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Yorhel <projects@yorhel.nl>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=ncdc
pkgver=1.22.1
pkgrel=3
pkgdesc='Modern and lightweight direct connect client with a friendly ncurses interface'
arch=('i686' 'x86_64' 'arm' 'armv6h')
url='http://dev.yorhel.nl/ncdc'
license=('MIT')
depends=('gnutls' 'sqlite' 'glib2' 'libmaxminddb')
source=("http://dev.yorhel.nl/download/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('74460D32B80810EBA9AFA2E962394C698C2739FA') # Yoran Heling, only used for releases

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-geoip
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('d15fd378aa345f423e59a38691c668f69b516cd4b8afbbcdc446007740c3afad'
            'SKIP')
