# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Chris Wong <https://wiki.archlinux.org/index.php/Special:EmailUser/Lambda_Fairy>
# Contributor: Francesco Minnocci <francesco dot minnocci at gmail dot com>

pkgname=xsettingsd-git
_pkgname=xsettingsd
pkgver=1.0.2.r7.g86ce25f
pkgrel=2
pkgdesc="Provides settings to X11 applications via the XSETTINGS specification"
arch=('i686' 'x86_64')
url="https://codeberg.org/derat/xsettingsd"
license=('BSD-3-Clause')
depends=('libx11' 'gcc-libs')
makedepends=('git' 'cmake')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S $_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}

