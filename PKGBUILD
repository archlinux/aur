# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_pkgname=vifm
pkgname=$_pkgname-git
pkgver=0.8.r300.g018078c
pkgrel=1
pkgdesc="Ncurses based file manager with vi like keybindings"
arch=('i686' 'x86_64')
url="http://vifm.info/"
license=('GPL')
depends=('ncurses' 'desktop-file-utils' 'file')
optdepends=('perl: vifm-convert-dircolors')
install=$pkgname.install
conflicts=('vifm')
provides=('vifm')
source=("git+https://github.com/vifm/vifm.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

build() {
    cd "${srcdir}"/$_pkgname
    ./configure --prefix=/usr \
                --without-gtk \
                --without-X11
    make
}

package() {
    cd "${srcdir}"/$_pkgname
    make DESTDIR="${pkgdir}" install
}
