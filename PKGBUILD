# SDR++ headers for building modules
# Maintainer: cropinghigh <joinmark60@gmail.com>
# Author: Ryzerth
pkgname=sdrpp-headers-git
pkgver=r1604.c89763a9
pkgrel=1
arch=('any')
pkgdesc="SDR++ headers for building out-of-tree modules"
license=('GPL-3.0-or-later')
depends=('sdrpp-git')
makedepends=('git')
provides=('sdrpp-headers')
conflicts=('sdrpp-headers')
source=("git+https://github.com/AlexandreRouma/SDRPlusPlus" "sdrpp_module.cmake")
url="https://github.com/AlexandreRouma/SDRPlusPlus"
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/SDRPlusPlus"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/SDRPlusPlus/core/src"
    mkdir -p "$pkgdir/usr/include/sdrpp_core/src"
    mkdir -p "$pkgdir/usr/share/cmake/Modules/"
    find . -regex ".*\.\(h\|hpp\)"  -exec sed -i -e s/Windows.h/windows.h/ {} \;
    find . -regex ".*\.\(h\|hpp\)" -exec cp --parents \{\} "$pkgdir/usr/include/sdrpp_core/src" \;
    cp "$srcdir/sdrpp_module.cmake" "$pkgdir/usr/share/cmake/Modules"
}
