# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkita64-bin
pkgver=a7
pkgrel=1
pkgdesc="Aarch64 toolchain for Nintendo Switch homebrew development (precompiled)"
arch=('x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
provides=("devkita64")
conflicts=("devkita64")
depends=('sh' 'zlib' 'lz4')
optdepends=('ncurses5-compat-libs: for aarch-none-elf-gdb'
            'expat: for aarch-none-elf-gdb')
install=devkita64.install
source=("devkita64.sh"
        "devkita64.fish"
        "https://github.com/devkitPro/buildscripts/releases/download/devkitA64_a7/devkitA64_$pkgver-$CARCH-linux.tar.xz")
sha256sums=('46c41f7ebafc0d1ade8887abe69f9fb11a5a19218cab310168c49d8d3fae4406'
            '2957124d50334a0cf79a7b9f1cd9dafbc85f32f989633c9c52232ca733d2341d'
            '46c30347abf1356327e9f3ab120c6e59f2daa18a1104bc5c2714013712e4768b')

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitA64 "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitA64/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitA64/share/info/*
  # export environment variables
  install -Dm755 devkita64.sh "$pkgdir"/etc/profile.d/devkita64.sh
  install -Dm644 devkita64.fish "$pkgdir"/etc/fish/conf.d/devkita64.fish
}
