# Maintainer: parnmatt <matt@parnmatt.co.uk>
# Previous Maintainer: 2ion <dev@2ion.de>

pkgname=cpdf-bin
pkgver=2.2
pkgrel=1
pkgdesc="Coherent PDF commandline tool binary to manipulate PDF files including merge, encrypt, decrypt, scale, crop, rotate, bookmarks, stamp, logos, page numbers, compress, etc."
arch=('x86_64' 'i686')
url="http://community.coherentpdf.com"
license=('custom:eula')
depends=('glibc')
makedepends=('coreutils' 'binutils') # install, strip
provides=('cpdf')
conflicts=('cpdf-git')
replaces=('cpdf-git')

_pkgname=${pkgname%-bin}
_base_url='https://raw.githubusercontent.com/coherentgraphics/cpdf-binaries/master'

source=( \
  "$_base_url/LICENSE" \
  "$_base_url/cpdfmanual.pdf" \
  )
md5sums=( \
  '8d549251f5c121ac09b33161a6254c2a' \
  'ef8a8e5db59ec49f80a7c1ba07444f44' \
  )

source_x86_64=( \
  "$_base_url/Linux-Intel-64bit/cpdf" \
  )
md5sums_x86_64=( \
  '9620fb4348dfa9a7ff49d53fa948fc45' \
  )

source_i686=( \
  "$_base_url/Linux-Intel-32bit/cpdf" \
  )
md5sums_i686=( \
  '87b13867c3e26a2d91cc7fa339b01b1f' \
  )

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
