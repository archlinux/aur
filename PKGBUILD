# $Id: PKGBUILD 100295 2013-11-02 08:51:09Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ustr-selinux
pkgver=1.0.4
pkgrel=4
pkgdesc="micro string API for C with patches to make it work with gcc>=5.1"
arch=(i686 x86_64)
url="http://www.and.org/ustr/"
license=('GPL')
depends=('glibc')
conflicts=("${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=(http://www.and.org/ustr/$pkgver/ustr-$pkgver.tar.bz2
    0001-Fix-the-prototype-of-ustrp_utf8_valid.patch
    0002-Mark-inline-functions-as-static-to-fix-build-with-GC.patch)
md5sums=('93147d9f0c9765d4cd0f04f7e44bdfce'
         'd01d97898f4c3b33a87c06e602ca9409'
         '9e7830ea74ff2f24f9b029746e883f3e')

prepare() {
  cd "$srcdir/${pkgname/-selinux}-$pkgver"
  patch -Np1 -i ../0001-Fix-the-prototype-of-ustrp_utf8_valid.patch
  patch -Np1 -i ../0002-Mark-inline-functions-as-static-to-fix-build-with-GC.patch
}

build() {
  cd "$srcdir/${pkgname/-selinux}-$pkgver"
  make
}

package() {
  cd "$srcdir/${pkgname/-selinux}-$pkgver"
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/share/doc/man $pkgdir/usr/share/
}
