# Maintainer: Richard Neumann aka. rne <r dot neumann at homeinfo fullstop de>

pkgname='libqmi-qmi-over-mbim'
pkgver='1.0.0'
pkgrel=1
pkgdesc="QMI modem protocol helper library with experimental qmi-over-mbim patch"
arch=('x86_64')
url='http://www.freedesktop.org/wiki/Software/libqmi/'
license=('GPL2')
depends=('glib2' 'bash')
makedepends=('autogen' 'gtk-doc' 'libmbim-qmi-over-mbim')
provides=('libqmi')
conflicts=('libqmi')
source=("git+https://cgit.freedesktop.org/libqmi")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


prepare() {
    cd libqmi
    git checkout qmi-over-mbim
    git pull origin qmi-over-mbim 
}


build() {
    cd libqmi
    ./autogen.sh --enable-mbim-qmux --prefix=/usr
}


package() {
    cd libqmi
    make DESTDIR="${pkgdir}/" install
    # Fix file name for ModemManager
    ln ${pkgdir}/usr/lib/libqmi-glib.so ${pkgdir}/usr/lib/libqmi-glib.so.1
}
