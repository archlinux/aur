# Maintainer: Huayu ZHANG <zhanghuayu.dev@gmail.com>

pkgname=i686-elf-binutils-aarch64
pkgver=2.39
pkgrel=1
pkgdesc="i686-elf-binutils build for host aarch64"
arch=('aarch64')
url="https://www.qemu.org/"
license=('GPL' 'LGPL')
depends=('zlib' 'libelf')
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz")
sha256sums=('645c25f563b8adc0a81dbd6a41cffbf4d37083a382e02d5d3df4f65c09516d00')

prepare() {
    cd "$srcdir"

    tar -xvf binutils-${pkgver}.tar.xz
    
}

build() {
    # build full first
    cd "$srcdir/binutils-${pkgver}"

    ./configure \
        --prefix=/usr/local \
        --target=i686-elf
    # edit /etc/makepkg.conf `MAKEFLAG` to speed up build
    make

}

package() {
    cd "$srcdir/binutils-${pkgver}"

    make DESTDIR="$pkgdir" install

    cd "$pkgdir/usr/local/share"

    rm -rf man
}
