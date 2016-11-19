# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=devkitppc-bin
pkgver=r28
pkgrel=1
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii/Wii U homebrew development (precompiled)'
arch=('i686' 'x86_64')
url="http://www.devkitpro.org/"
license=('GPL')
options=(!strip libtool staticlibs)
provides=("devkitppc")
conflicts=("devkitppc")
depends=('gcc-libs' 'sh' 'zlib')
optdepends=('ncurses5-compat-libs: for powerpc-eabi-gdb'
            'expat: for powerpc-eabi-gdb')
install=devkitppc.install
source=("devkitppc.sh"
        "devkitppc.fish")
source_x86_64=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitPPC_$pkgver-x86_64-linux.tar.bz2")
source_i686=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitPPC_$pkgver-i686-linux.tar.bz2")
sha256sums=('3e7ab84e123f76c65a92c27932b4f80df598b9da6b0f44745d8d465120449d1d'
            'ab0c74e766fab7ada98541c530593b9f717a72d386f9bb9dad2779a080c66b9d')
sha256sums_x86_64=('018840ed42185ae811b8614b4f53e7e95a4e2b1605b67586050a4b2108110056')
sha256sums_i686=('49e92701da4c5602d3d17869eb4477eb9588a43d724082f35526f6c11f65a41b')

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitPPC "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/share/info/*
  # export environment variables
  install -Dm755 devkitppc.sh "$pkgdir"/etc/profile.d/devkitppc.sh
  install -Dm644 devkitppc.fish "$pkgdir"/etc/fish/conf.d/devkitppc.fish
}
