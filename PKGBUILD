# Maintainer: pandaxtc <uixtd883a@mozmail.com>

_gitname='kara'
pkgname="plasma6-applets-${_gitname}-git"
pkgver=0.8.0.r2.g2c9f792
pkgrel=1
pkgdesc='KDE Plasma Pager Applet'
url='https://github.com/dhruv8sh/kara'
license=('GPL-3.0-only')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(
    'git'
    'cmake'
    'extra-cmake-modules'
    'plasma-workspace'
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_gitname}"
    
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "${_gitname}"

    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
