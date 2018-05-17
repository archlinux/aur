# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=devkitppc-bin
pkgver=r30
pkgrel=1
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii/Wii U homebrew development (precompiled)'
arch=('i686' 'x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
provides=("devkitppc")
conflicts=("devkitppc")
depends=('sh')
optdepends=('ncurses5-compat-libs: for powerpc-eabi-gdb')
install=devkitppc.install
source=("https://github.com/devkitPro/buildscripts/releases/download/devkitPPC_$pkgver/devkitPPC_$pkgver-linux.tar.xz"
        "devkitppc.sh"
        "devkitppc.fish")
sha256sums=('6f71cf2bdd9706f361c9f77fd5ebaea609765518ba45ad6a8e6ff2e1a5de734d'
            '69755d0b77c0c3233dee9255a5d897710410be18b9dcdfb8d9d6b18c6945ae34'
            '135a9cbe1fc28c96c2ce38b19cd305857ce49ed56e35bfb5bd96638a51c3ec6f')

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
