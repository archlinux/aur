# Maintainer: r4v3n6101

pkgname=xash-dedicated-git
pkgver=r1742.92cfa2af
pkgrel=1
pkgdesc="A custom GoldSrc engine implementation (dedicated server)"
arch=('x86_64')
url="http://xash.su/"
license=('GPL3')
makedepends=('make' 'binutils' 'python')
makedepends_i686=('gcc' 'gcc-libs')
makedepends_x86_64=('gcc-multilib' 'lib32-gcc-libs')
provides=('xash_ded')
conflicts=('xash3d-hlsdk' 'xash3d-git' 'xash3d-fwgs-dedicated-git')
source=("$pkgname::git+https://github.com/FWGS/xash3d-fwgs" xash_ded)
md5sums=('SKIP' '1a5bd603fbe564455b83d43b3102ff08')

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/$pkgname
    ./waf configure -T release --enable-lto --enable-poly-opt -d
}

build() {
    cd $srcdir/$pkgname
    ./waf build
}

package() {
    cd $srcdir
    install -Dm 755 "xash_ded" "${pkgdir}/usr/bin/xash_ded"
    cd $pkgname
    ./waf install --strip --destdir="${pkgdir}/usr/local/bin/"
}
