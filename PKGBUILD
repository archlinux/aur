# Maintainer: Andrew Simmons <agsimmons0@gmail.com>
pkgname=arma3-unix-launcher-git
pkgver=r391.63d7e8c
pkgrel=1
pkgdesc='Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)'
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('nlohmann-json' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog' 'hicolor-icon-theme')
makedepends=('git' 'fmt')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    mkdir ./build
    cd ./build
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -D CMAKE_SKIP_INSTALL_RPATH="YES" ..
    make
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "./external/steamworks-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/steamworks-LICENSE.txt"
    
    cd ./build
    make install
}
