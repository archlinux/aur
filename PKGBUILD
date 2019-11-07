# Maintainer: parnmatt <matt@parnmatt.co.uk>
# Previous Maintainer: 2ion <dev@2ion.de>

pkgname=cpdf-bin
pkgver=2.3
pkgrel=1
pkgdesc='Coherent PDF commandline tool binary to manipulate PDF files including merge, encrypt, decrypt, scale, crop, rotate, bookmarks, stamp, logos, page numbers, compress, etc.'
arch=('x86_64' 'i686')
url='http://community.coherentpdf.com'
license=('custom')
depends=('glibc')
makedepends=('coreutils' 'binutils') # install, strip
provides=('cpdf')
conflicts=('cpdf')

_pkgname=${pkgname%-bin}
_pkgcommit='44f75c5be154b6666d4f4507f9ffb3e514fe4940'
_base_url="https://raw.githubusercontent.com/coherentgraphics/cpdf-binaries/${_pkgcommit}"

source=( \
  "${_base_url}/LICENSE" \
  "${_base_url}/cpdfmanual.pdf" \
)
md5sums=( \
  '8d549251f5c121ac09b33161a6254c2a' \
  'ce08846463064845a5ce18191dd90298' \
)

source_x86_64=("${_base_url}/Linux-Intel-64bit/cpdf")
md5sums_x86_64=('dff16ee6958ec822c99324d513567d71')

source_i686=("${_base_url}/Linux-Intel-32bit/cpdf")
md5sums_i686=('52f71326feb83b71ba2559681ea3048c')

prepare() {
  cd "$srcdir"
  strip cpdf
}

package() {
  cd "$srcdir"
  install -Dm755 cpdf             "${pkgdir}/usr/bin/cpdf"
  install -Dm644 LICENSE          "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 cpdfmanual.pdf   "${pkgdir}/usr/share/doc/${_pkgname}/cpdfmanual.pdf"
}
