# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=uriparser
pkgver=0.8.4
pkgrel=2
pkgdesc='uriparser is a strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode'
url='https://sourceforge.net/projects/uriparser/'
makedepends=('doxygen' 'graphviz')
arch=('x86_64')
license=("custom")
source=("https://downloads.sourceforge.net/sourceforge/uriparser/$pkgname-$pkgver.tar.bz2")
sha256sums=('ce7ccda4136974889231e8426a785e7578e66a6283009cfd13f1b24a5e657b23')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  sed -i \
    -e 's|{css,gif,html,png}|{css,html,png}|' \
    -e 's|html/\*.map||' \
    doc/Makefile{.am,.in}
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  [ -f Makefile ] || ./configure --prefix=/usr --disable-test
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -D -m644 "${srcdir}/$pkgname-$pkgver/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
