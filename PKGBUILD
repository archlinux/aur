# Maintainer: LekKit <github.com/LekKit>

pkgname=neural-amp-modeler-lv2-git
pkgver=0.1.3_r149.43fb036
pkgrel=1
pkgdesc="Neural Amp Modeler (NAM) LV2 Plugin"
arch=('x86_64' 'aarch64' 'riscv64' 'riscv' 'ppc' 'i386' 'i686' 'pentium4' 'arm' 'armv7h' 'armv6h')
url="https://github.com/mikeoliphant/neural-amp-modeler-lv2"
license=('GPL3')
makedepends=('git' 'cmake' 'make' 'gcc')
provides=('neural-amp-modeler-lv2')
conflicts=('neural-amp-modeler-lv2')
source=("$pkgname::git+https://github.com/mikeoliphant/neural-amp-modeler-lv2.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "0.1.3_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    git submodule update --init --recursive --depth 1
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE="Release"
    make -j
}

package() {
    mkdir -p $pkgdir/usr/lib/lv2/
    cp $pkgname/build/neural_amp_modeler.lv2 -r $pkgdir/usr/lib/lv2/
}
