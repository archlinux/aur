# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=soapyfcdpp-git
pkgver=r57.45fb07c
pkgrel=1
pkgdesc="Soapy SDR plugin for Funcube Dongle Pro+"
arch=('any')
license=('BSL')
makedepends=('git' 'cmake')
depends=('soapysdr' 'alsa-lib' 'hidapi')
url="https://github.com/pothosware/SoapyFCDPP"
source=($pkgname::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd $srcdir/$pkgname
    mkdir build && cd build
    cmake ..
}

build(){
    cd $srcdir/$pkgname/build
    make
}

package() {
    cd $srcdir/$pkgname/build
    make DESTDIR=$pkgdir install
}
