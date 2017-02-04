# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=devkitppc-bin
pkgver=r29.1
pkgrel=1
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii/Wii U homebrew development (precompiled)'
arch=('i686' 'x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
provides=("devkitppc")
conflicts=("devkitppc")
depends=('gcc-libs' 'sh' 'zlib')
optdepends=('ncurses5-compat-libs: for powerpc-eabi-gdb')
optdepends_x86_64=('expat: for powerpc-eabi-gdb'
                   'python2: for powerpc-eabi-gdb'
                   'xz: for powerpc-eabi-gdb')
install=devkitppc.install
source=("devkitppc.sh"
        "devkitppc.fish")
source_i686=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitPPC_${pkgver/./-}-i686-linux.tar.bz2")
source_x86_64=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitPPC_${pkgver/./-}-x86_64-linux.tar.bz2")
sha256sums=('3e7ab84e123f76c65a92c27932b4f80df598b9da6b0f44745d8d465120449d1d'
            'ab0c74e766fab7ada98541c530593b9f717a72d386f9bb9dad2779a080c66b9d')
sha256sums_i686=('3683abfbe0b359a209bfcaa7902075232b999aa6f623b0eb17d0d1ceafe09ba9')
sha256sums_x86_64=('fc4e4ce51584b3a50e7a658f4234f04fdc9bb2a77db544aaa01678c3a9fa900c')

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitPPC "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/share/info/*
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/info/*
  # export environment variables
  install -Dm755 devkitppc.sh "$pkgdir"/etc/profile.d/devkitppc.sh
  install -Dm644 devkitppc.fish "$pkgdir"/etc/fish/conf.d/devkitppc.fish
}
