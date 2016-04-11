# Maintainer: GI Jack <iamjacksemail@hackermail.com>

# This is a packaged plugin for i2p. It assumes you are using the packaging of
# i2p as used with the arch i2p package in AUR. This package is to keep all
# software maintained by the system package manager, and to facilitate
# redistribution of botes as an arch package

_pluginame=seedless
pkgname=i2p-plugin-${_pluginame}
pkgver=0.1.7_0.1.12
pkgrel=2
pkgdesc="A distributed email client for I2P"
arch=('any')
url="http://sponge.i2p/files/seedless/doc/how-it-works.txt"
license=('WTFPL')
groups=('i2p-plugins')
depends=('i2p' 'i2p-neodatis')
makedepends=('unzip')
provides=('i2p-seedless')
# get this from http://sponge.i2p/files/seedless/02_seedless.xpi2p
source=("file://02_${_pluginame}.xpi2p")
noextract=("file://02_${_pluginame}.xpi2p")
install="${_pluginame}.install"
sha256sums=('26df04b135a9b0a4fcd37e8f911972c157529b84c51a7569695da2e6ce366989')

prepare() {
  cd "${srcdir}"

  #yeah, this is a regular zip file, but with some wierd shit added as a header.
  # nooo, they couldn't just use an index file like normal people.
  local -i headlength=56

  local outfile="${_pluginame}.zip"
  local infile="02_${_pluginame}.xpi2p"
  dd if="${infile}" bs=${headlength} skip=1 of="${outfile}"
  unzip -d i2p "$outfile"
}
package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/i2p/.i2p/plugins/"
  cp -Ra "i2p" "${pkgdir}/opt/i2p/.i2p/plugins/02_${_pluginame}"
}

