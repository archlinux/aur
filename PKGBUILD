# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Rickard Gustafsson <rickard@allyourbase.se>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Joel Klinghed <the_jk@yahoo.com>
# Contributor: Paweł Tomak <pawel@tomak.eu>

pkgname=pike
pkgver=8.0.1738
pkgrel=1
pkgdesc='Dynamic programming language with a syntax similar to Java and C'
arch=('x86_64')
url='http://pike.lysator.liu.se'
license=('GPL2' 'LGPL' 'MPL')
depends=('sane' 'libzip' 'libmariadbclient' 'gtkglarea' 'nettle')
source=("${url}/pub/${pkgname}/all/${pkgver}/Pike-v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('1033bc90621896ef6145df448b48fdfa342dbdf01b48fd9ae8acf64f6a31b92a'
            'cd49d01f2fcd4e038cc7fe32cc10489752398d7a495e784132893a134e31f96c')

prepare() {
  cd "Pike-v${pkgver}"

  patch -p1 -i ../${pkgname}.patch
}

build() {
  cd "Pike-v${pkgver}"

  make CONFIGUREARGS=" \
    --prefix=/usr \
    --libdir=/usr/lib \
    --disable-make_conf \
    --disable-noopty-retry \
    --without-cdebug \
    --without-bundles \
    --without-copt \
    --without-libpdf \
    --without-ssleay \
    --with-crypt \
    --with-gif \
    --with-gmp \
    --with-bignums \
    --without-machine-code \
    --with-weak-curves \
    --without-fuse"
}

package() {
  cd "Pike-v${pkgver}"

  make buildroot="${pkgdir}" INSTALLARGS='--traditional' install_nodoc
  install -Dm644 man/pike.1 "${pkgdir}/usr/share/man/man1/pike.1"
}
