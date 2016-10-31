# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=uriparser
pkgver=0.8.2
pkgrel=1
pkgdesc="uriparser is a strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode"
url="http://sourceforge.net/projects/uriparser/"
depends=()
makedepends=(doxygen graphviz)
arch=('i686' 'x86_64')
license=("custom")
source=(http://downloads.sourceforge.net/sourceforge/uriparser/$pkgname-$pkgver.tar.bz2)
md5sums=('c5cf6b3941d887deb7defc2a86c40f1d')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  [ -f Makefile ] || ./configure --prefix=/usr --disable-test
  sed -i 's|{css,gif,html,png}|{css,html,png}|' doc/Makefile
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 "${srcdir}/$pkgname-$pkgver/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
