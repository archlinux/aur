# Maintainer: parnmatt <matt@parnmatt.co.uk>
# Previous Maintainer: 2ion <dev@2ion.de>

pkgname=cpdf-bin
pkgver=2.5
pkgrel=1
pkgdesc='Coherent PDF commandline tool binary to manipulate PDF files including merge, encrypt, decrypt, scale, crop, rotate, bookmarks, stamp, logos, page numbers, compress, etc.'
arch=('x86_64' 'i686')
url='http://community.coherentpdf.com'
license=('custom')
depends=()
makedepends=('coreutils' 'binutils') # install, strip
provides=('cpdf')
conflicts=('cpdf')

[ "$CARCH" = "x86_64" ] && carch_path="Linux-Intel-64bit"
[ "$CARCH" = "i686" ] && carch_path="Linux-Intel-32bit"

_pkgname=${pkgname%-bin}
source=("$pkgname-$pkgver.$pkgrel.zip::https://github.com/coherentgraphics/cpdf-binaries/archive/refs/tags/v2.5.1.zip")
sha256sums=("54b9364d8f07a913bece4af30ff36f48e949f9c4b11445e350d8c109d5168dd8")

check() {
  cd "$_pkgname-binaries-$pkgver.$pkgrel" || return 1
}

prepare() {
  cd "$_pkgname-binaries-$pkgver.$pkgrel" || return 1
  strip "$carch_path/cpdf"
}

package() {
  cd "$_pkgname-binaries-$pkgver.$pkgrel" || return 1
  install -Dm755 "$carch_path/cpdf"   "${pkgdir}/usr/bin/cpdf"
  install -Dm644 LICENSE              "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 cpdfmanual.pdf       "${pkgdir}/usr/share/doc/${_pkgname}/cpdfmanual.pdf"
}
