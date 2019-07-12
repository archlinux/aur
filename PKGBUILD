# Maintainer: Kevin McCormack <harlemsquirrel@gmail.com>
# https://code.alephobjects.com/w/cura-lulzbot/
pkgname=cura-lulzbot
pkgver=3.6.13
pkgrel=1
pkgdesc='Cura LulzBot Edition for LulzBot 3D Printers by Aleph Objects, Inc.'
arch=('x86_64')
url='https://www.lulzbot.com/cura'
license=('AGPLv3')
source=("http://download.alephobjects.com/ao/aodeb/dists/stretch/main/binary-amd64/cura-lulzbot_${pkgver}_amd64.deb")
md5sums=('a94bfe8f2ae018acda9c6fdec4fff322')
depends=('gcc6-fortran')

prepare() {
  # Unpack the tarball containing the 'usr/' directory,
  # where all the essentials reside within the debian package
  tar zxf "${srcdir}/data.tar".gz -C "${srcdir}"
  fortran_lib_dir=`dirname $(find /usr/lib/gcc/x86_64-pc-linux-gnu/6* -name libgfortran.so.3 -print -quit)`
  sed -i "s;LD_LIBRARY_PATH=;LD_LIBRARY_PATH=${fortran_lib_dir}:;" "${srcdir}/usr/bin/cura-lulzbot"
}

package() {
  cp -r "${srcdir}"/usr "${pkgdir}"/usr
}

# Update md5sum
# updpkgsums

## Update .SRCINFO
# makepkg --printsrcinfo | tee .SRCINFO
