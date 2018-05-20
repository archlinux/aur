# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>
#   forked from AUR package masterpdfeditor

pkgname=masterpdfeditor4
pkgver=4.3.89
pkgrel=1
pkgdesc='A complete solution for creation and editing PDF files - v4 (latest without watermarks in free version)'
url='https://code-industry.net/free-pdf-editor/'
arch=('x86_64')
license=('custom')
makedepends=('patchelf')
source_x86_64=("http://get.code-industry.net/public/master-pdf-editor-${pkgver}_qt5.amd64.tar.gz")
sha1sums_x86_64=('254e05e0845ff73b7c932280c2bbe8d22aa4934c')

package() {
  depends=('gcc-libs' 'glibc' 'libgl' 'nspr' 'nss' 'qt5-base' 'qt5-svg' 'sane')

  install -d "$pkgdir"{/opt/,/usr/bin/}
  cp -a --no-preserve=ownership master-pdf-editor-${pkgver%%.*} "$pkgdir/opt/"

  cd "$pkgdir/opt/master-pdf-editor-${pkgver%%.*}"
  ln -sr masterpdfeditor${pkgver%%.*} -t "$pkgdir/usr/bin/"
  install -Dm644 masterpdfeditor${pkgver%%.*}.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  patchelf --remove-rpath masterpdfeditor${pkgver%%.*}
}
