# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mkcl
pkgver=1.1.10
pkgrel=1
pkgdesc="ManKai Common Lisp"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/mkcl/"
license=('LGPL3' 'custom')
depends=('gawk')
provides=('common-lisp' 'cl-asdf')
conflicts=('mkcl')
source=("http://common-lisp.net/project/$pkgname/releases/$pkgname-$pkgver.tar.gz" blank.patch)
md5sums=('04c3dba410579e3caac49abaa9ca0c1f'
         '3d1beb963c043626c83ecec212d659f1')
options=('staticlibs' '!makeflags')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < ../blank.patch
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
  install -m 644 -D "Copyright" \
	  "$pkgdir/usr/share/licenses/$pkgname/Copyright"
  find "$pkgdir" -name "*.a" -exec chmod 644 {} \;
}
