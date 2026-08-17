# Maintainer: dim <mlrudasill@gmail.com>

pkgname='astramarket'
pkgver=1.0.2
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
sha256sums=('8dd1fc4cd22d4f07daecef3d93372ca5e59008c52c0e5f7dbacf5275a2519a37')

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
