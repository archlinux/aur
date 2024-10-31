# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Dennis Hamester <dennis.hamester@startmail.com>
# Contributor: rafasc
# Contributor: willemw
# Contributor: aksr

_pkgname=vifm
pkgname=$_pkgname-git
pkgver=0.13.r599.g579dccd1e
pkgrel=1
pkgdesc="Ncurses based file manager with vi like keybindings"
arch=('i686' 'x86_64')
url="http://vifm.info/"
license=('GPL')
depends=('ncurses' 'desktop-file-utils')
makedepends=('git' 'perl')
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
    scripts/fix-timestamps fast
    ./configure --prefix=/usr \
                --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}"/$_pkgname
    make DESTDIR="${pkgdir}" install
}
