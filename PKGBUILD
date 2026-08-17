# Maintainer: Markus Moser<marmoser@wu.ac.at>
pkgname=naviserver
pkgver=5.1.0
pkgrel=1
pkgdesc="A versatile multiprotocol (httpd et al) server written in C/Tcl"
arch=('x86_64')
url="https://github.com/naviserver-project/naviserver"
license=('MPL')
depends=('tcllib>=1.17' 'tcl>=8.5.18' 'tdom>=0.8.3' 'nsf>=1.6.8' 'systemd')
source=("http://download.sourceforge.net/sourceforge/naviserver/${pkgname}-${pkgver}.tar.gz" 
"naviserver.service")
md5sums=("c4f758530223479c158d29f825563b4b"
"28fd20ff41798834ca22f12e98991210")

build() {
    cd "naviserver-${pkgver}"
    msg "Starting make..."
    msg "make in $(pwd)"
    ./configure --enable-threads --enable-symbols --prefix /usr/local/ns
    make 
}

package() {
    install="${pkgname}.install"
    cd ${pkgname}-${pkgver}
    make install-dirs DESTDIR=${pkgdir}
    make install-include DESTDIR=${pkgdir}
    make install-tcl  DESTDIR=${pkgdir}
    make install-modules  DESTDIR=${pkgdir}
    make install-certificates DESTDIR=${pkgdir}
    make install-doc DESTDIR=${pkgdir}
    make install-examples DESTDIR=${pkgdir}
    make install-config DESTDIR=${pkgdir}
    install -D "${srcdir}/naviserver.service" "${pkgdir}/usr/lib/systemd/system/naviserver.service"
}
