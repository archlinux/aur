# Maintainer: Liang Wei <weiliang1503@163.com>

pkgname=sonobus-git
pkgver=1.4.5.r0.g52cb09f
pkgrel=1
pkgdesc="An easy to use application for streaming high-quality, low-latency peer-to-peer audio, Git version"
arch=('i686' 'x86_64')
url="https://sonobus.net"
license=('GPL3')
depends=('opus' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor' 'libasound.so=2-64' 'libjack.so=0-64')
makedepends=('cmake')
source=("git+https://github.com/sonosaurus/sonobus.git")
sha512sums=('SKIP')

pkgver() {
  cd sonobus
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
  
build() {
    cd sonobus

    cmake -B build  \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build -j$(nproc)
}

package() {
    cd "sonobus/linux"

    install -d "$pkgdir/usr"

    ./install.sh "$pkgdir/usr"
}
