# Maintainer: core_contingency <ccontingency(at)gmail(dot)com>
# Contributor: ScarecrowDM <diego(dot)busnelli@hotmail(dot)com>
# Contributor: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
# Contributor: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

_pkgname=libstrangle
_latest_release=0.1.1

pkgname=${_pkgname}-git
pkgdesc="Simple FPS Limiter"
pkgver=0.1.1.r135.0273e31
pkgrel=2
url='https://gitlab.com/torkel104/libstrangle'
arch=('x86_64')
depends=('lib32-gcc-libs' 'lib32-glibc' 'libglvnd' 'linux-api-headers' 'libx11' 'xorgproto')
makedepends=('git')
provides=('libstrangle')
conflicts=('libstrangle')
license=('GPL3')
source=("git+https://gitlab.com/torkel104/libstrangle.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" \
		"$_latest_release" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname
    sed -i -e '/ldconfig/d' makefile
}

build() {
    cd $_pkgname
    make prefix=/usr
}

package() {
    cd $_pkgname
    make prefix=/usr DESTDIR="$pkgdir" install-common install-32 install-64 install-ld

    # Install the README.md locally
    install -d "$pkgdir/usr/share/doc/$_pkgname"
    install -m644 -t "$pkgdir/usr/share/doc/$_pkgname" README.*
}

#
# makepkg --printsrcinfo > .SRCINFO
#
