# Maintainer: M. Damian "G'lek" Mulligan <glek at glektarssza dot com>
# Contributor: Mike Pento <mpento@darkforge.net>

_gitname=arc-icon-theme
pkgname=arc-icon-theme-git
pkgver=20161122
pkgrel=2
pkgdesc='Arc icon theme. Latest commit from the master branch on GitHub.'
arch=(any)
url=https://github.com/horst3180/arc-icon-theme
license=('GPL3')
depends=('gtk-update-icon-cache' 'moka-icon-theme-git')
makedepends=('git' 'automake')
source=("git+https://github.com/horst3180/${_gitname}.git#branch=master")
sha256sums=('SKIP')
replaces=('arc-icon-theme')
provides=('arc-icon-theme')
conflicts=('arc-icon-theme')
options=('!strip')

pkgver() {
    cd "${_gitname}" || exit 1
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_gitname}" || exit 1
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_gitname}" || exit 1
    make DESTDIR="$pkgdir" install
}
