# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann dot de>

pkgname='libmbim-qmi-over-mbim'
pkgver='latest'
pkgrel=1
pkgdesc="MBIM modem protocol helper library with experimental qmi-over-mbim patch"
arch=('i686' 'x86_64')
url='http://www.freedesktop.org/wiki/Software/libmbim/'
license=('GPL2')
depends=('glib2' 'bash' 'systemd' 'libgudev')
makedepends=('git' 'gtk-doc')
provides=('libmbim')
conflicts=('libmbim')
source=("git+https://cgit.freedesktop.org/libmbim/libmbim")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


pkgver() {
    cd libmbim
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    cd libmbim
    git checkout qmi-over-mbim
    git pull origin qmi-over-mbim
}


build() {
    cd libmbim
    ./autogen.sh --prefix=/usr
}


package() {
    cd libmbim
    make DESTDIR="${pkgdir}/" install
    libtool --finish "${pkgdir}/usr/lib"
}
