# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=uriparser
pkgver=0.8.1
pkgrel=1
pkgdesc="uriparser is a strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode"
url="http://sourceforge.net/projects/uriparser/"
depends=()
makedepends=(doxygen graphviz)
arch=('i686' 'x86_64')
license=("custom")
source=(http://downloads.sourceforge.net/sourceforge/uriparser/$pkgname-$pkgver.tar.bz2)
md5sums=('4e4c5f0ee6abb111a431c45e144247aa')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  [ -f Makefile ] || ./configure --prefix=/usr --disable-test
  sed -i 's|{css,gif,html,png}|{css,html,png}|' doc/Makefile
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -D -m644 "${srcdir}/$pkgname-$pkgver/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
