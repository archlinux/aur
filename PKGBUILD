# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Thayer Williams <thayer at archlinux dot org>
# Contributor: James Rayner <james at archlinux dot org>
# Contributor: William Rea <sillywilly at gmail dot com>

pkgname=tango-icon-theme-extras
pkgver=0.1.0
pkgrel=6
pkgdesc="Extra icons for Tango"
arch=('any')
url="http://tango.freedesktop.org"
license=('custom:ccpl-attribution-sharealike-2.5')
depends=('tango-icon-theme')
makedepends=('imagemagick' 'icon-naming-utils' 'librsvg')
options=(!strip !zipman)
source=(${url}/releases/${pkgname}-${pkgver}.tar.gz
        rsvg.patch)
md5sums=('caaceaec7b61f1cbda0db9842f9db281'
         'aedaa8f1126b78a085ad8ce53b1c8b7e')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 < "${srcdir}/rsvg.patch"
  autoreconf -fi
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-png-creation
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
