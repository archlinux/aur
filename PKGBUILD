# Maintainer: kekmacska

pkgname=asm-top-git
pkgver=0.3.1.r4.gf04e1cf
pkgrel=1
pkgdesc="A lightweight system monitoring tool written in pure x86-64 assembly for Linux. (similiar to top command just without processes)"
arch=('x86_64')
url="https://github.com/c0m4r/asm-top"
license=('CC0-1.0')
makedepends=('nasm' 'make')
source=('git+https://github.com/c0m4r/asm-top.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    cd "${pkgname%-*}"
    # extra optimization flags are kinda pointless in assembly
    make -j$(nproc)
}

package() {
    cd "${pkgname%-*}"

    #binary
    install -Dm755 "${pkgname%-*}" "$pkgdir/usr/bin/${pkgname%-*}"

    #license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
