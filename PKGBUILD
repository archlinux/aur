# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Aaron <aaron@aaronlindsay.com>
# Contributor: TheGuy <lowelink26381@gmail.com>

pkgname=devkitarm-bin
pkgver=r43
pkgrel=1
pkgdesc="ARM toolchain for GP32, Nintendo DS and GBA homebrew development (precompiled)"
arch=('i686' 'x86_64')
url="http://www.devkitpro.org/"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
provides=("devkitarm")
conflicts=("devkitarm")
depends=('gcc-libs' 'sh')
optdepends=('libtinfo: for arm-none-eabi-gdb')
if [ "$CARCH" == "x86_64" ]; then
  depends+=('zlib')
  optdepends+=('expat: for arm-none-eabi-gdb'
               'libudev.so.0: for st-link and dfu-util')
fi
install=devkitarm.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitARM_$pkgver-$CARCH-linux.tar.bz2"
        "devkitarm.sh")
sha256sums=('7e6a253dc4cf7c97779965b6fc917035e3ad44b17fb60c09212d2696f283d77e'
            'fc5489fab5ee4ce5cd53c2e1549fd2958872a6777324920b89e03b88584072db')
[ "$CARCH" == "i686" ] && sha256sums[0]='dcd10878777488994738c265999b372eea563982f001f6d7d2a447436ac963a4'

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitARM "$pkgdir"/opt/devkitpro
  # export environment variables
  install -Dm755 devkitarm.sh "$pkgdir"/etc/profile.d/devkitarm.sh
}
