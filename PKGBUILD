# Maintainer: Jose M. Dana

pkgname=xxgdb
pkgver=1.12
pkgrel=1
pkgdesc='A simple but powerful graphical interface to gdb'
arch=('i686' 'x86_64')
url='ftp://ftp.x.org/contrib/utilities/'
license=('unknown')
depends=('gdb' 'glibc' 'libxaw' 'libxt' 'libx11' 'imake')
provides=('xxgdb')

source=(
    "ftp://ftp.x.org/contrib/utilities/xxgdb-${pkgver}.tar.gz"
    "xxgdb-pty.patch" # http://zhu-qy.blogspot.com.es/2012/11/slackware-14-i-still-got-xxgdb-all-ptys.html
    )

md5sums=(
    "d7e447aeb9cab29a90d9d65f8f9a306c"
    "0dbf3325cf629a8b2195d98acfe9096c"
    )

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -Np1 -i "${srcdir}"/xxgdb-pty.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    xmkmf 
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # Remove conflictive mess
    rm ${pkgdir}/usr/lib/X11/app-defaults
    mkdir ${pkgdir}/usr/lib/X11/app-defaults
    mv ${pkgdir}/etc/X11/app-defaults/XDbx ${pkgdir}/usr/lib/X11/app-defaults/
    rm -R ${pkgdir}/etc/
}

