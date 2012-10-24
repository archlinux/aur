# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=uriparser
pkgver=0.7.5
pkgrel=2
pkgdesc='Strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode'
url="http://sourceforge.net/projects/uriparser/"
depends=(glibc)
makedepends=(doxygen)
arch=('i686' 'x86_64')
license=("custom")
source=(http://downloads.sourceforge.net/sourceforge/uriparser/$pkgname-$pkgver.tar.bz2)
md5sums=('4f4349085fe5de33bcae8d0f26649593')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  [ -f Makefile ] || ./configure --prefix=/usr --disable-test
  ln -s ${srcdir}/$pkgname-$pkgver/doc/Doxyfile.in ${srcdir}/$pkgname-$pkgver/doc/Doxyfile
  sed -i 's|{css,gif,html,png}|{css,html,png}|' doc/Makefile
  make
  make DESTDIR=$pkgdir install
  install -D -m644 "${srcdir}/$pkgname-$pkgver/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
