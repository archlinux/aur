# Maintainer:  twa022 <twa022 at gmail dot com>

pkgbase=gnome-python
pkgname=('gnome-python' 'python2-gconf')
pkgver=2.28.1
pkgrel=12
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('pygtk' 'gconf')
url="http://www.pygtk.org/"
source=(https://download.gnome.org/sources/gnome-python/2.28/gnome-python-${pkgver}.tar.bz2)
sha256sums=('759ce9344cbf89cf7f8449d945822a0c9f317a494f56787782a901e4119b96d8')

build() {
    cd "${srcdir}/gnome-python-${pkgver}"
    PYTHON=python2 ./configure --prefix=/usr --disable-gnome --disable-gnomeui --disable-gnomecanvas --disable-gnomevfs --disable-gnomevfsbonobo --disable-pyvfsmodule --disable-bonobo_activation --disable-bonobo --disable-bonoboui

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package_gnome-python() {
    pkgdesc="PyGNOME Python extension module"
    depends=('python2-gconf')

    cd "${srcdir}/gnome-python-${pkgver}"
    make install-pkgconfigDATA DESTDIR="${pkgdir}"
}

package_python2-gconf(){
    pkgdesc="Python bindings for interacting with GConf"
    depends=('pygtk' 'gconf')

    cd "${srcdir}/gnome-python-${pkgver}"
    make -C gconf install DESTDIR="${pkgdir}"
}

