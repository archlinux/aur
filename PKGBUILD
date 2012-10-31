# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-pinyin
pkgver=1.4.0
pkgrel=2
pkgdesc='The PinYin Engine for IBus Input Framework.'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://ibus.googlecode.com'
depends=('ibus')
makedepends=('intltool')
install=ibus-pinyin.install
source=("http://ibus.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
        "http://ibus.googlecode.com/files/pinyin-database-1.2.99.tar.bz2")
sha1sums=('499ceb4d3bec5614f88322b8e7695c04586b63e9'
          'e38a148a772e9909facda66b2d579e17b94cccbe')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ln -sf "${srcdir}/pinyin-database-1.2.99.tar.bz2" \
    "${srcdir}/${pkgname}-${pkgver}/data/db/open-phrase"

  sed -i -e "s|python|python2|" data/db/android/create_db.py \
      setup/ibus-setup-pinyin.in

  PYTHON=python2 ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus \
    --enable-db-open-phrase

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make NO_INDEX=true DESTDIR="${pkgdir}" install
}
