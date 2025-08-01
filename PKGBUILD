# Maintainer: Neurofibromin <125222560+Neurofibromin@users.noreply.github.com>
# Contributor: Neurofibromin <125222560+Neurofibromin@users.noreply.github.com>
pkgname=mfaomp
pkgver=0.7.1
pkgrel=1
pkgdesc="Multiple Files At Once Media Player"
arch=('x86_64')
url="https://github.com/Neurofibromin/mfaomp"
license=('GPL-3.0-or-later')
depends=(
    'vlc'
    'vlc-plugins-all'
    'libvlc'
    'qt6-base'
    'qt6-multimedia'
    'qt6-webengine'
    'gcc-libs'
    'libglvnd'
    'glibc'
    'boost'
    'ffmpeg'
    'sdl2-compat'
)
makedepends=(
    'cmake'
    'gcc'
    'pkgconf'
    'qt6-base'
    'qt6-multimedia'
    'qt6-webengine'
    'boost'
    'ffmpeg'
    'sdl2-compat'
    'libvlc'
    'git'
)
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9b6a197ec5af390cdad8bfd9fae0a33565e0793cdb1fca3f8848f9c53041f45310b16a255e22a550b33f27083b75ca037a25ffba3c5ca172920942c1d0d3332f')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
}

build() {
    cmake -S "$srcdir/$pkgname-$pkgver" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_CATCH=OFF
    cmake --build build
}

package() {
    cmake --install build --prefix "$pkgdir/usr"
}
