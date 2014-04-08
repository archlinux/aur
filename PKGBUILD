# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Aaron <aaron@aaronlindsay.com>
# Contributor: TheGuy <lowelink26381@gmail.com>

pkgname=devkitarm-bin
pkgver=r42
pkgrel=1
pkgdesc="ARM toolchain for GP32, Nintendo DS and GBA homebrew development (precompiled)"
arch=('i686' 'x86_64')
url="http://www.devkitpro.org/"
license=('GPL')
options=(!strip libtool staticlibs)
provides=("devkitarm")
conflicts=("devkitarm")
depends=('gcc-libs' 'libusb' 'sh')
optdepends=('libtinfo: for arm-none-eabi-gdb')
if [ "$CARCH" == "x86_64" ]; then
  optdepends+=('expat: for arm-none-eabi-gdb'
              'python2=2.7: for arm-none-eabi-gdb'
              'xz: for arm-none-eabi-gdb'
              'zlib: for arm-none-eabi-gdb')
fi
install=devkitarm.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitARM_$pkgver-$CARCH-linux.tar.bz2"
        "devkitarm.sh")
sha256sums=('189fbb8ac0b289c1e370e0e128945e2447031521dcef0730312ef1e124127b49'
            'a6f33eaf2d89493f5bb557ef82c6286793c7e69dd3f6de6be85733835b193bd7')
[ "$CARCH" == "i686" ] && sha256sums[0]='a5e9e499f7dff3738853c5fa2dddc9fa8670b81c7ef293d4f2bc0fbd6535faba'

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitARM "$pkgdir"/opt/devkitpro
  # export environment variables
  install -Dm755 devkitarm.sh "$pkgdir"/etc/profile.d/devkitarm.sh
}
