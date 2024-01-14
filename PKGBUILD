# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=xxd-standalone
pkgver=9.1.0023
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
        "xxd-${pkgver}-Makefile::https://raw.githubusercontent.com/vim/vim/v${pkgver}/src/xxd/Makefile"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/xxd-LICENSE")
sha256sums=('cae7b6acfdafc6602e2e81d330c5c329833d7aa9217e84cf1e68e7d020fbd3e7'
            '2e12c5a5c63ad0a1eb323452caa1ea6f853b0a6fedbfae99ddd4d26d486a8b87'
            '7e9621ada1c17f6fae14e106a502642c8ad1ed3551beb2278b925d73c9f04159'
            '2ac99e6ff2ee077cfec2133d0d5d2d4f14b156994c4c1896703cda98c2d21845')
# check versions at https://github.com/vim/vim/tree/master/src/xxd

prepare() {
  mv xxd-${pkgver}.c xxd.c
}

build() {
  make -f "xxd-${pkgver}-Makefile"
}

package() {
  install -Dm755 xxd "${pkgdir}/usr/bin/xxd"
  install -Dm644 xxd-${pkgver}.1 "${pkgdir}/usr/share/man/man1/xxd.1"
  install -Dm644 xxd-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
