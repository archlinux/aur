# Maintainer: m8D2 <omui at proton mail dot com>
# Contributor: Patrick Goetz <pgoetz at mail dot utexas dot edu>
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Ferik <djferik at gmail dot com>

pkgname=masterpdfeditor-arm
pkgver=5.8.46
pkgrel=2
pkgdesc='A complete solution for viewing, creating and editing PDF files (for arm64)'
url='https://code-industry.net/free-pdf-editor/'
arch=(aarch64)
conflicts=(masterpdfeditor-free masterpdfeditor)
license=('custom')
makedepends=(patchelf)
source_aarch64=("https://code-industry.net/public/master-pdf-editor-${pkgver}-qt5.arm64.tar.gz")
sha1sums_aarch64=('ceaa2f83cc54cc32b86b0b2aefe92227c439768d')

package() {
  depends=('libgl' 'nspr' 'nss' 'qt5-base' 'qt5-svg' 'qt5-declarative' 'sane')

  install -d "$pkgdir"{/opt/,/usr/bin/}
  cp -a --no-preserve=ownership master-pdf-editor-${pkgver%%.*} "$pkgdir/opt/"

  cd "$pkgdir/opt/master-pdf-editor-${pkgver%%.*}"
  ln -sr masterpdfeditor${pkgver%%.*} -t "$pkgdir/usr/bin/"
  install -Dm644 masterpdfeditor${pkgver%%.*}.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 license.txt -t "$pkgdir/usr/share/licenses/masterpdfeditor/"
  patchelf --remove-rpath masterpdfeditor${pkgver%%.*}
}
