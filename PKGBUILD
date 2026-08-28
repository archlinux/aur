# qt6-m3shapes-git

# Maintainer: Soramane <soramane32 at gmail dot com>

_pkgname='qt6-m3shapes'
pkgname="$_pkgname-git"
pkgver=r38.6875533
pkgrel=1
pkgdesc='A Qt6 library for Material 3 Expressive shapes'
arch=('x86_64' 'aarch64')
url='https://github.com/soramanew/m3shapes'
license=('Apache-2.0')
depends=('qt6-base' 'qt6-declarative')
makedepends=('git' 'cmake' 'ninja' 'qt6-shadertools')
provides=($_pkgname)
conflicts=($_pkgname 'caelestia-shell<2.4.0')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
