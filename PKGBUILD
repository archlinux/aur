# Maintainer: loooph <loooph@gmx.de>
pkgname=obs-shaderfilter-git
pkgver=1.21.2
pkgrel=1
pkgdesc="enables custom shaders for OBS sources"
arch=('x86_64')
url="https://github.com/exeldro/obs-shaderfilter/"
license=('Unlicense')
depends=(obs-studio)
makedepends=(git)
_basename=${pkgname%-git}
provides=("$_basename")
conflicts=("$_basename")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_basename"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "$_basename" -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
