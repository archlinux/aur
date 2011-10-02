# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-pinyin
pkgver=1.3.99.20110706
pkgrel=1
pkgdesc='The PinYin Engine for IBus Input Framework.'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://ibus.googlecode.com'
depends=('ibus')
makedepends=('intltool')
install=ibus-pinyin.install
source=("http://ibus.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
        "http://ibus.googlecode.com/files/pinyin-database-1.2.99.tar.bz2")
md5sums=('0d9d5d78106c2d36c28a00b74aa9a6c3'
         'd0951b8daa7f56a2cbd3b6b4e42532e0')

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
