# Maintainer: ScarecrowDM <diego(dot)busnelli@hotmail(dot)com>
# Maintainer: core_contingency <ccontingency(at)gmail(dot)com>
# Contributor: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
# Contributor: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

_pkgname=libstrangle
pkgname=${_pkgname}-git
pkgdesc="Simple FPS Limiter"
pkgver=r68.a5aa280
pkgrel=4
url='https://gitlab.com/torkel104/libstrangle'
arch=('x86_64')
makedepends=('git' 'gcc-multilib')
provides=('libstrangle')
conflicts=('libstrangle')
license=('GPL3')
source=("git+https://gitlab.com/torkel104/libstrangle.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname

    sed -i -e '/ldconfig/d' makefile
}

package() {
    cd $_pkgname

    make prefix=/usr DESTDIR="$pkgdir" install

    # Install the README.md locally
    install -d "$pkgdir/usr/share/doc/$_pkgname"
    install -m644 -t "$pkgdir/usr/share/doc/$_pkgname" README.*
}
