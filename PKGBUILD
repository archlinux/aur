# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=devkitppc-bin
pkgver=r27
pkgrel=1
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii homebrew development (precompiled)'
arch=('i686' 'x86_64')
url="http://www.devkitpro.org/"
license=('GPL')
options=(!strip libtool staticlibs)
provides=("devkitppc")
conflicts=("devkitppc")
depends=('gcc-libs' 'sh')
optdepends=('libtinfo: for powerpc-eabi-gdb')
if [ "$CARCH" == "x86_64" ]; then
  optdepends+=('expat: for powerpc-eabi-gdb'
              'python2=2.7: for powerpc-eabi-gdb'
              'xz: for powerpc-eabi-gdb'
              'zlib: for powerpc-eabi-gdb')
fi
install=devkitppc.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitPPC_$pkgver-$CARCH-linux.tar.bz2"
        "devkitppc.sh")
sha256sums=('50454704fc530de91989507e9ec748bbf54345baaab800e4bb58b9b08c3e8853'
            'a7bb9f8050601cf1fad4a8bcb04c2bf24b1d29f93c7dc567ddb7e610388a04a0')
[ "$CARCH" == "i686" ] && sha256sums[0]='379e81958dee04d1bbcd446c89d8f089d4072f695eaf3623112efd23b0d0466f'

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitPPC "$pkgdir"/opt/devkitpro
  # export environment variables
  install -Dm755 devkitppc.sh "$pkgdir"/etc/profile.d/devkitppc.sh
}
