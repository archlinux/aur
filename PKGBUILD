# Maintainer: Toria <ninetailedtori@uwu.gal>

pkgname=masterpdfeditor-qt_include
_pkgname=${pkgname%-qt_include}
pkgver=5.9.90
_pkgver=5.9.90
pkgrel=1
pkgdesc='A complete solution for viewing, creating and editing PDF files'
url='https://code-industry.net/free-pdf-editor/'
_checksum="$(curl https://code-industry.net/checksum-information/ | grep master-pdf-editor-$_pkgver-qt5.x86_64-qt_include.tar.gz)"
arch=('x86_64')
license=('custom')
depends=(libgl
		 pkcs11-helper
		 sane
		 xcb-util-image
		 xcb-util-keysyms
		 xcb-util-renderutil
		 xcb-util-wm
		 'glibc>=2.28')
makedepends=('patchelf')
provides=("$_pkgname=$_pkgver")
conflicts=("$_pkgname")
source_x86_64=("https://code-industry.net/public/master-pdf-editor-$_pkgver-qt5.x86_64-qt_include.tar.gz")
sha1sums_x86_64=("${_checksum% *}")

package() {
  install -d "$pkgdir"{/opt/,/usr/bin/}
  cp -a --no-preserve=ownership master-pdf-editor-${pkgver%%.*} "$pkgdir/opt/"

  cd "$pkgdir/opt/master-pdf-editor-${pkgver%%.*}"
  ln -sr masterpdfeditor${pkgver%%.*} -t "$pkgdir/usr/bin/"
  install -Dm644 masterpdfeditor${pkgver%%.*}.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 license_en.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  patchelf --remove-rpath masterpdfeditor${pkgver%%.*}
}
