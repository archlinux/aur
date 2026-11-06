# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Ansgar Taflinski <ataflinski at uni-koblenz dot de>

_pkgname=spice-protocol
pkgname="${_pkgname}"-git
pkgver=0.14.5.r1.g499cc83
pkgrel=1
pkgdesc='Headers defining SPICE protocols'
arch=('any')
url='https://www.spice-space.org'
license=('BSD-3-Clause')
makedepends=('git' 'meson')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.freedesktop.org/spice/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --always --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    rm -Rf build && mkdir build
    cd ${_pkgname}
    arch-meson ../build
    ninja -v -C ../build
}

package() {
    cd ${_pkgname}
    DESTDIR="${pkgdir}/" ninja -C ../build install
    install -D -m644 "${srcdir}"/${_pkgname}/COPYING \
      "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
