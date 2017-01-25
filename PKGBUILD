# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Ferik <djferik at gmail dot com>

pkgname=masterpdfeditor
pkgver=4.0.30
pkgrel=1
pkgdesc='A complete solution for creation and editing PDF files'
url='http://code-industry.net/free-pdf-editor.php'
arch=('x86_64')
license=('custom')
depends=('qt5-base' 'qt5-svg' 'sane')
makedepends=('patchelf')
source=('masterpdfeditor.desktop')
source_x86_64=("http://get.code-industry.net/public/master-pdf-editor-${pkgver}_qt5.amd64.tar.gz")
sha256sums=('7c585afe0760855a0a509d6edf10d9f1dd6b73c045ec6cac39939a96d0ce796b')
sha256sums_x86_64=('5c0fc5446c5c543e8b87ac75e7589ee55c63a583cd5a9748a713320f2a46f89c')

package() {
  install -d "$pkgdir"{/opt/,/usr/bin/,/usr/share/applications/}
  cp -a --no-preserve=ownership master-pdf-editor-${pkgver%%.*} "$pkgdir/opt/"
  sed "s/VERMAJ/${pkgver%%.*}/g" masterpdfeditor.desktop > "$pkgdir/usr/share/applications/masterpdfeditor${pkgver%%.*}.desktop"
  ln -s /opt/master-pdf-editor-${pkgver%%.*}/masterpdfeditor${pkgver%%.*} -t "$pkgdir/usr/bin/"
  install -Dm644 master-pdf-editor-${pkgver%%.*}/license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  patchelf --remove-rpath "$pkgdir/opt/master-pdf-editor-${pkgver%%.*}/masterpdfeditor${pkgver%%.*}"
}
