# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Co-Maintainer: Ziusudra <ziusudra.zoon@gmail.com>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=dfhack-bin
_pkgname=dfhack
pkgver=0.47.04
_pkgver=$pkgver-r2
pkgrel=3
pkgdesc="memory hacking library for Dwarf Fortress and a set of tools that use it"
arch=('x86_64' 'i686')
url="https://dfhack.readthedocs.io/en/stable/"
license=('custom')
depends=("dwarffortress=$pkgver" lua protobuf libpng12 libxrandr libjpeg6 freetype2 libglvnd libxcursor libxinerama)

conflicts=(dfhack dfhack-git)
provides=(dfhack)

source_i686=("https://github.com/DFHack/dfhack/releases/download/$_pkgver/dfhack-$_pkgver-Linux-32bit-gcc-7.tar.bz2")
source_x86_64=("https://github.com/DFHack/dfhack/releases/download/$_pkgver/dfhack-$_pkgver-Linux-64bit-gcc-7.tar.bz2")
source=(dfhack.sh
        dfhack-run.sh)

md5sums_i686=('ec2f69a52fbd963ec9bcb72559077544')
md5sums_x86_64=('fe9a34ca6c2097b95156d220a45a4ee8')
md5sums=('81f5909c1a32391679f968e40f24d5ca'
         '3853c6f890d3541f710f2c4833a9e696')


prepare() {
  # shellcheck disable=2154
  sed -e 's|setarch i386 -R ||' \
      -i "$srcdir"/dfhack
}

package() {
  # shellcheck disable=2154
  install -d "$pkgdir"/opt/dwarffortress

  cp -r "$srcdir"/{hack,dfhack,dfhack-run,dfhack-config,dfhack.init-example,stonesense} "$pkgdir"/opt/dwarffortress

  install -Dm755 "$srcdir"/dfhack.sh     "$pkgdir"/usr/bin/dfhack
  install -Dm755 "$srcdir"/dfhack-run.sh "$pkgdir"/usr/bin/dfhack-run

  install -Dm644 "$srcdir"/hack/LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
