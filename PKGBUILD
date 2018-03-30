# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Aaron <aaron@aaronlindsay.com>
# Contributor: TheGuy <lowelink26381@gmail.com>

pkgname=devkitarm-bin
pkgver=r47
pkgrel=3
pkgdesc="ARM toolchain for GP32, Nintendo (3)DS and GBA homebrew development (precompiled)"
arch=('x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
provides=("devkitarm")
conflicts=("devkitarm")
depends=('gcc-libs' 'sh' 'zlib' 'libusb')
optdepends=('ncurses5-compat-libs: for arm-none-eabi-gdb'
            'expat: for arm-none-eabi-gdb'
            'libsystemd: for dfu-util')
install=devkitarm.install
source=("devkitarm.sh"
        "devkitarm.fish"
        "https://github.com/devkitPro/buildscripts/releases/download/devkitARM_$pkgver/devkitARM_$pkgver-$CARCH-linux.tar.bz2")
sha256sums=('2162a4cf8ae8567b5ddff631474f28b6a0a5d0bce43915396b7dea602e2131e0'
            '13357e81de7ec8d7ad7f9fb37a78c23c4f99c6f7ca67d3a0070eedc388deb938'
            '8173ec9e9ec53022e5a1c9a6376a010fdae6bc1446f2c5bd44cef1124f2a77db')

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitARM "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitARM/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitARM/share/info/*
  # export environment variables
  install -Dm755 devkitarm.sh "$pkgdir"/etc/profile.d/devkitarm.sh
  install -Dm644 devkitarm.fish "$pkgdir"/etc/fish/conf.d/devkitarm.fish
}
