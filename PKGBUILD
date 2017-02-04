# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Aaron <aaron@aaronlindsay.com>
# Contributor: TheGuy <lowelink26381@gmail.com>

pkgname=devkitarm-bin
pkgver=r46
pkgrel=1
pkgdesc="ARM toolchain for GP32, Nintendo (3)DS and GBA homebrew development (precompiled)"
arch=('i686' 'x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
provides=("devkitarm")
conflicts=("devkitarm")
depends=('gcc-libs' 'sh' 'gmp' 'libusb')
optdepends=('ncurses5-compat-libs: for arm-none-eabi-gdb')
optdepends_x86_64=('expat: for arm-none-eabi-gdb'
                   'libsystemd: for dfu-util')
optdepends_i686=('libudev0: for dfu-util')
install=devkitarm.install
source=("devkitarm.sh"
        "devkitarm.fish")
source_i686=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitARM_$pkgver-i686-linux.tar.bz2")
source_x86_64=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitARM_$pkgver-x86_64-linux.tar.bz2")
sha256sums=('9448465b2de6b6aefc5e0a8404f780f737cb86b4b1280d653712271b892908f9'
            'c4cc42b085be7c48f06f75c934e846a61749d9ba5e31ee463a03ba27a01c8afd')
sha256sums_i686=('688b3b66e66bb4a0b12139599b314fab700630be2b29f21f0e85e62729674bbe')
sha256sums_x86_64=('388b5f5a8f09ccee00073b799ac922aed099b2e0cafcca0d25a5a18b779194ae')

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
