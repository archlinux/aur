# Maintainer: Markus Moser<marmoser@wu.ac.at>
pkgname=nsf
pkgver=2.4.0
pkgrel=1
pkgdesc="The Next Scripting Framework (for short: NSF) is an infrastructure
 for creating object-oriented scripting languages based on Tcl. This package
 provides two object-orientated extensions for Tcl, NX and XOTcl2."
arch=('x86_64')
url="https://next-scripting.org"
license=('MIT')
depends=(tcl)
conflicts=(xotcl)
source=("http://downloads.sourceforge.net/project/next-scripting/${pkgver}/nsf${pkgver}.tar.gz")
md5sums=("f62ed6db0960b2e3f9f1a214fc2107c7")

build() {
    cd nsf${pkgver}
    ./configure 
make
}

package() {
    cd nsf${pkgver}
    make install DESTDIR=${pkgdir}
    #fix broken symlink
    ln -sf /usr/lib/nsf${pkgver}/libnsf${pkgver}.so  ${pkgdir}/usr/lib/libnsf${pkgver}.so
    #rename manpages to avoid naming collisions
    mv ${pkgdir}/usr/share/man/man3/Class.3 ${pkgdir}/usr/share/man/man3/Class.3nx
    mv ${pkgdir}/usr/share/man/man3/Object.3 ${pkgdir}/usr/share/man/man3/Object.3nx
    mv ${pkgdir}/usr/share/man/man3/configure.3 ${pkgdir}/usr/share/man/man3/configure.3nx
    mv ${pkgdir}/usr/share/man/man3/current.3 ${pkgdir}/usr/share/man/man3/current.3nx
    mv ${pkgdir}/usr/share/man/man3/next.3 ${pkgdir}/usr/share/man/man3/next.3nx
}

