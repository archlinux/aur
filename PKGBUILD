# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=xxd-standalone
pkgver=9.0.1383
pkgrel=1
pkgdesc="Hexdump utility from vim"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://www.vim.org"
license=(GPL2 "custom: MIT-X11") # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=776191
provides=(xxd)
conflicts=(xxd)
depends=(glibc)
source=("xxd-${pkgver}.c::https://raw.githubusercontent.com/vim/vim/v${pkgver}/src/xxd/xxd.c"
        "xxd-${pkgver}.1::https://raw.githubusercontent.com/vim/vim/v${pkgver}/runtime/doc/xxd.1"
        "$pkgname-Makefile::https://raw.githubusercontent.com/vim/vim/master/src/xxd/Makefile"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/xxd-LICENSE")
sha256sums=('d38c7ebb9ed6d2ed080a9936d6db79bce463c110af95837ddef90cc3f0d4aba0'
            'b7822e307fe41854658d967571e6a52d792afef70508bedd0c665088e2afa8b0'
            '96d7229490da56fbf6cae3791407238636b2979e1f607e535f55ec26068303c5'
            '2ac99e6ff2ee077cfec2133d0d5d2d4f14b156994c4c1896703cda98c2d21845')
# check versions at https://github.com/vim/vim/tree/master/src/xxd

prepare() {
  mv xxd-${pkgver}.c xxd.c
}

build() {
  make -f $pkgname-Makefile
}

package() {
  install -Dm755 xxd "${pkgdir}/usr/bin/xxd"
  install -Dm644 xxd-${pkgver}.1 "${pkgdir}/usr/share/man/man1/xxd.1"
  install -Dm644 xxd-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
