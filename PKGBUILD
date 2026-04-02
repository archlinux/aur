# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>
# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>
# Contributor: Antonio Cardace <antonio@cardace.it>

_pkgname="s2argv-execs"
pkgname="${_pkgname}-git"
pkgver=1.4.r1.72ac0cd
pkgrel=1

pkgdesc="string 2 argv conversion. execs = execute a file taking its arguments from a string"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/virtualsquare/$_pkgname"
license=('LGPL-2.1-only')
groups=('virtualsquare')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    git -C "${srcdir}/${_pkgname}" describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/${_pkgname}/build"
    cd "${srcdir}/${_pkgname}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm 644 COPYING -T "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    cd build
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et
