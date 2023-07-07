# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname='gnome-python'
provides=('python2-gconf')
conflicts=('python2-gconf')
pkgdesc='Legacy PyGNOME Python 2 extension module'
pkgver=2.28.1
pkgrel=14
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python2' 'pygtk' 'gconf' 'libgnomecanvas' 'libgnome' 'libgnomeui' 'libbonobo' 'libbonoboui')
makedepends=()
url='http://www.pygtk.org/'
source=("https://download.gnome.org/sources/$pkgname/2.28/$pkgname-${pkgver}.tar.bz2")
sha256sums=('759ce9344cbf89cf7f8449d945822a0c9f317a494f56787782a901e4119b96d8')

build() {
    cd "${srcdir}/$pkgname-${pkgver}"
    PYTHON=python2 ./configure --prefix=/usr --enable-gnome --enable-gnomeui --enable-gnomecanvas --enable-gnomevfs --enable-gnomevfsbonobo --enable-pyvfsmodule --enable-bonobo_activation --enable-bonobo --enable-bonoboui

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/$pkgname-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
