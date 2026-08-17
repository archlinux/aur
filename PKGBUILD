# Maintainer: dim <mlrudasill@gmail.com>

pkgname='astramarket'
pkgver=1.0.3
pkgrel=1
pkgdesc='Unified Linux marketplace with Flatpak, Pacman, AUR, and AppImage support'
arch=('x86_64')
url='https://github.com/dim-ghub/AstraMarket'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools' 'qt6-svg')
makedepends=('cmake' 'ninja' 'pkgconf' 'qt6-shadertools')
optdepends=('flatpak: Flatpak package support'
            'paru: AUR package support'
            'yay: AUR package support'
            'pacman: Pacman package support')
provides=('astramarket' 'astra')
conflicts=('astramarket-bin' 'astramarket-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e7ee676c0ee32f2a8475be53bb0addb2366c3cd6a1bd14602d725d97ca526d8c')

_builddir="AstraMarket-$pkgver"

build() {
    cd "${srcdir}/${_builddir}"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${_builddir}"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
