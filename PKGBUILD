# Maintainer: Marcos Heredia <chelqo@gmail.com>

pkgname="parrillada"
pkgver="1.6.2"
pkgrel="2"
pkgdesc="A CD/DVD burning application for MATE Desktop"
arch=('i686' 'x86_64')
url="https://github.com/darkshram/parrillada"
screenshot="http://www.alcancelibre.org/images/parrillada-main_mini.png"
license=('GPL2')
groups=('mate-extra')
depends=('mate-desktop>=1.6' 'gstreamer0.10' 'cdrkit' 'totem-plparser')
optdepends=('beagle>=0.3.0' 'tracker>=0.7.0' 'libburn>=0.4.0' 'libisofs>=0.6.2')
install="$pkgname.install"
source=("http://www.alcancelibre.org/projects/sources/${pkgname}/${pkgname}-${pkgver}.tar.xz")
md5sums=('830cb9f35e0eb4a60dd9152bddfc9f58')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    autoreconf -fi
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
    _docdir=${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
    _licdir=${pkgdir}/usr/share/licenses/${pkgname}
    install -dpm755 ${_docdir} ${_licdir}
    install -Dpm644 AUTHORS COPYING ChangeLog INSTALL MAINTAINERS NEWS README ${_docdir}/
    install -Dpm644 COPYING ${_licdir}/
    cd ${pkgdir}/usr/share/parrillada
    ln -s ../icons/hicolor/48x48/apps/parrillada.png logo.png
}
