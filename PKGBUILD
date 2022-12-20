# Maintainer: Huayu ZHANG <zhanghuayu.dev@gmail.com>

pkgname=qemu-full-aarch64-git
pkgver=g33698d3abf
pkgrel=1
pkgdesc="qemu full build from source for Arch Linux ARM (aarch64) with KVM enabled"
arch=('aarch64')
url="https://www.qemu.org/"
license=('GPL' 'LGPL')
depends=('ninja' 'pixman' 'meson' 'gtk3-debug' 'gtk3' 'capstone' 'vte' 'sdl2' 'glib2-debug' 'glib2' 'python' 'bzip2-debug' 'bzip2' 'zlib-debug' 'dtc' 'libslirp')
source=("${pkgname}::git+https://github.com/qemu/qemu.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"

    mkdir "$srcdir/$pkgname/full-build"
    # mkdir "$srcdir/$pkgname/aarch64-kvm"
    
}

build() {
    # build full first
    cd "$srcdir/$pkgname/full-build"

    ../configure \
        --prefix=/usr
    # edit /etc/makepkg.conf `MAKEFLAG` to speed up build
    make

    # # build aarch64 with kvm  support
    # cd "$srcdir/$pkgname/aarch64-kvm"

    # ../configure \
    #     --prefix=/usr \
    #     --target-list=aarch64-softmmu \
    #     --enable-fdt \
    #     --enable-kvm

    # make
}

package() {
    cd "$srcdir/$pkgname/full-build"
    make DESTDIR="$pkgdir" install

    # cd "$srcdir/$pkgname/aarch64-kvm"
    # make DESTDIR="$pkgdir" install
}

# kvm test use: qemu-system-aarch64 -M virt -cpu host --enable-kvm
