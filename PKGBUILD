# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=cabocha
pkgver=0.69
pkgrel=1
pkgdesc="Yet Another Japanese Dependency Structure Analyzer"
url="https://taku910.github.io/cabocha/"
arch=('x86_64' 'i686')
license=('LGPL2.1' 'BSD')
depends=('crfpp' 'mecab' 'mecab-ipadic')
source=("${pkgname}-${pkgver}.tar.bz2::https://doc-04-74-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/4d2ns4qhmb0vqdmnjdkrt6i4kd89toa8/1433851200000/13553212398903315502/*/0B4y35FiV1wh7SDd1Q1dUQkZQaUU?e=download")
sha1sums=("9196098628c5d1f0b83b371a03352b6652c04001")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # '--with-charset=UTF8' and '--enable-utf8-only' is optional.
  # you can remove it (see INSTALL in source directory)
  ./configure --prefix=/usr --with-charset=UTF8 --enable-utf8-only
  make ${MAKEFLAGS}
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
