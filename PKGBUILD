# Maintainer: GI Jack <iamjacksemail@hackermail.com>

# This is a packaged plugin for i2p. It assumes you are using the packaging of
# i2p as used with the arch i2p package in AUR. This package is to keep all
# software maintained by the system package manager, and to facilitate
# redistribution of botes as an arch package

_pluginame=i2pbote
pkgname=i2p-plugin-${_pluginame}
pkgver=0.4.3
pkgrel=1
pkgdesc="A distributed email client for I2P"
arch=('any')
url="http://bote.i2p/"
license=('GPLv3')
groups=('i2p-plugins')
depends=('i2p')
makedepends=('unzip')
provides=('i2pbotes')
# get this from http://bote.i2p/i2pbote.su3
source=("file://${_pluginame}.su3")
noextract=("file://${_pluginame}.su3")
sha256sums=('19ae8e09f932d111dc8016e9a3c4f6fa78c059a650d3d735de08d5c1233b7780')

prepare() {
  cd "${srcdir}"

  local outfile="${_pluginame}.zip"
  local infile="${_pluginame}.su3"

  #yeah, this is a regular zip file, but with some wierd shit added as a header.
  # nooo, they couldn't just use an index file like normal people.
  local -i headlength=70
  dd if="${infile}" bs=${headlength} skip=1 of="${outfile}"
  unzip -d i2p "$outfile"
}

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/i2p/plugins/.i2p/"
  cp -Ra "i2p" "${pkgdir}/opt/i2p/.i2p/plugins/${_pluginame}"
}

