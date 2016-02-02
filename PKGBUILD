# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=clpeak-git
pkgver=r112.4be2b6f
pkgrel=1
pkgdesc="A tool which profiles OpenCL devices to find their peak capacities"
arch=(i386 x86_64)
url="https://github.com/krrishnarraj/clpeak"
license=(custom:unlicense)
depends=(ocl-icd)
conflicts=(clpeak)
makedepends=(git opencl-headers)
source=('git+https://github.com/krrishnarraj/clpeak.git')
md5sums=('SKIP')

_name=clpeak

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_name"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$_name"
    install -D -m755 clpeak "$pkgdir/usr/bin/$_name"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
