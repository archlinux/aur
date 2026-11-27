# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=qt6-imvqml
pkgver=0.1.4
pkgrel=1
pkgdesc='Qt Quick image pipeline with an isolated decoder'
arch=('x86_64')
url='https://github.com/alexindigo/imvqml'
license=('LGPL-3.0-only')
depends=('glib2' 'glibc' 'libgcc' 'libstdc++' 'libvips' 'libwebp' 'qt6-base' 'qt6-declarative' 'qt6-imageformats' 'kimageformats')
makedepends=('cmake' 'mpv' 'ninja')
optdepends=('mpv: optional video frame capture')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('975c0c7e9bfe8e0c6796af85d11162cfab92d0eaf5e8ada09e86eb5d94628cad')

build() {
    cmake -S "imvqml-$pkgver" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib/imvqml \
        -DBUILD_TESTING=OFF \
        -DIMV_ENABLE_VIDEO=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
