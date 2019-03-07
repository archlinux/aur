# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=devkitppc-bin
pkgver=r34
pkgrel=1
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii/Wii U homebrew development (precompiled)'
arch=('x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
provides=("devkitppc")
conflicts=("devkitppc")
depends=('sh')
optdepends=('ncurses5-compat-libs: for powerpc-eabi-gdb')
install=devkitppc.install
source=("devkitppc.sh"
        "devkitppc.fish"
        "https://github.com/devkitPro/buildscripts/releases/download/devkitPPC_$pkgver/devkitPPC_$pkgver-linux.tar.xz"
        "https://github.com/devkitPro/devkitppc-rules/releases/download/v1.0.0/devkitppc-rules-1.0.0.tar.xz")
sha256sums=('69755d0b77c0c3233dee9255a5d897710410be18b9dcdfb8d9d6b18c6945ae34'
            '135a9cbe1fc28c96c2ce38b19cd305857ce49ed56e35bfb5bd96638a51c3ec6f'
            '2d16f74344d8617c07d12756de311cd4967092dfb90d6c2a5e2371eb4c2f5e9d'
            '91b35b1ca5b1d54bbbb4d3a8873c6245abc1437a658bbc12a81dffc4072a59b4')

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitPPC "$pkgdir"/opt/devkitpro
  # FIXME: devkitppc-rules is now seperated
  install -m644 *_rules *_tools "$pkgdir"/opt/devkitpro/devkitPPC
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/share/info/*
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/info/*
  # export environment variables
  install -Dm755 devkitppc.sh "$pkgdir"/etc/profile.d/devkitppc.sh
  install -Dm644 devkitppc.fish "$pkgdir"/etc/fish/conf.d/devkitppc.fish
}
