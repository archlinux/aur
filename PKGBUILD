# Maintainer: Armin K. <krejzi at email dot com>

pkgname=imsettings
pkgver=1.6.7
pkgrel=2
pkgdesc="framework that delivers Input Method settings and applies the changes immediately"
arch=('i686' 'x86_64')
url="http://tagoh.bitbucket.org/imsettings/"
license=('LGPL2')
depends=('gtk2' 'ibus' 'libgxim' 'libnotify')
makedepends=('check' 'gconf' 'gobject-introspection' 'gtk3' 'xfconf')
optdepends=('gconf: GConf backend'
            'ibus-qt: IBus support in Qt4 apps'
            'xfconf: Xfce backend')
options=('!libtool')
source=("https://bitbucket.org/tagoh/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2"
        'ibus.conf')
sha256sums=('0d40099e93eb82bd35c29322df374297ae3286b5879b21f5056c8d4b5b7577dd'
            '47769b7f6e435fe3c39e5c64c374b7d2311f3e0b43d9ddbcf230b652d25a6464')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/${pkgname} --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 "${srcdir}/ibus.conf" "${pkgdir}/etc/X11/xinit/xinput.d/ibus.conf"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
