# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=faba-icon-theme-git
_pkgname=${pkgname%-git}
pkgver=4.3
pkgrel=1
pkgdesc='A sexy and modern FreeDesktop icon set with Tango and elementary influences'
arch=('any')
url='https://snwh.org/moka'
license=('GPL3' 'CCPL:by-sa')
depends=('gtk-update-icon-cache')
makedepends=('git' 'meson')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("git+https://github.com/snwh/${_pkgname}.git")
sha256sums=('SKIP')
install=${_pkgname}.install

prepare() {
    cd "${srcdir}/${_pkgname}"
    # Remove execute permission on files
    chmod -R -x+X .
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    meson --prefix=/usr --buildtype=plain "build"
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="${pkgdir}" ninja -C "build" install
}
