# Maintainer: GI Jack <iamjacksemail@hackermail.com>

# This is a packaged plugin for i2p. It assumes you are using the packaging of
# i2p as used with the arch i2p package in AUR. This package is to keep all
# software maintained by the system package manager, and to facilitate
# redistribution of botes as an arch package

_pluginame=neodatis
pkgname=i2p-plugin-${_pluginame}
pkgver=2.1_2.14_209_17
pkgrel=1
pkgdesc="Some I2P middleware for seedless"
arch=('any')
url="http://i2pwiki.i2p/index.php?title=Plugins"
license=('GPLv3')
groups=('i2p-plugins')
depends=('i2p')
makedepends=('unzip')
provides=('i2p-neodatis')
# get this from http://sponge.i2p/files/seedless/01_neodatis.xpi2p
source=("file://01_${_pluginame}.xpi2p")
noextract=("file://01_${_pluginame}.xpi2p")
sha256sums=('3af50cb8d735b1ef0077789d6c1ea438735b1caef59bfbfdfd443fc3623e64be')

prepare() {
  cd "${srcdir}"

  #yeah, this is a regular zip file, but with some wierd shit added as a header.
  # nooo, they couldn't just use an index file like normal people.
  local -i headlength=56

  local outfile="${_pluginame}.zip"
  local infile="01_${_pluginame}.xpi2p"
  dd if="${infile}" bs=${headlength} skip=1 of="${outfile}"
  unzip -d i2p "$outfile"
}
package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/i2p/.i2p/plugins/"
  cp -Ra "i2p" "${pkgdir}/opt/i2p/.i2p/plugins/01_${_pluginame}"
}

