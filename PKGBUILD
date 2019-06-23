# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# vim:set ts=2 sw=2 et:

pkgname=cabocha
pkgver=0.69
pkgrel=3
pkgdesc="Yet Another Japanese Dependency Structure Analyzer"
url="https://taku910.github.io/cabocha/"
arch=('x86_64' 'i686')
license=('LGPL2.1' 'BSD')
depends=('crfpp' 'mecab' 'mecab-ipadic')
makedepends=('git')
source=('git+https://github.com/taku910/cabocha.git')

build() {
  cd ${srcdir}/${pkgname}
  autoreconf -vif

  # '--with-charset=UTF8' and '--enable-utf8-only' is optional.
  # you can remove it (see INSTALL in source directory)
  ./configure --prefix=/usr --with-charset=UTF8 --enable-utf8-only
  make ${MAKEFLAGS}
}

check() {
  cd ${srcdir}/${pkgname}
  make check
}

package() {
  cd ${srcdir}/${pkgname}

  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

sha256sums=('SKIP')
