# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=djpdf
pkgver=0.1.1
pkgrel=1
pkgdesc="Create small, searchable PDFs from scanned documents"
arch=(any)
url="https://github.com/Unrud/djpdf"
license=(GPL3)
depends=(hicolor-icon-theme imagemagick jbig2enc pyside2 python-colorama python-dbus python-pdfrw python-pillow python-psutil python-webcolors python-xmp-toolkit qpdf tesseract)
makedepends=(python-setuptools)
source=("https://github.com/Unrud/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('acc433c66abb3c906c55b35c27bee88a249ec2ff6f887a4ca734c8973aad0ed6')

build() {
  cd $pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 desktop/com.github.unrud.djpdf.appdata.xml "$pkgdir"/usr/share/metainfo/com.github.unrud.djpdf.appdata.xml
  install -Dm644 desktop/com.github.unrud.djpdf.desktop "$pkgdir"/usr/share/applications/com.github.unrud.djpdf.desktop
  for s in 16 32 48 64 128 256 512; do
    convert +set date:create +set date:modify desktop/com.github.unrud.djpdf.png -resize ${s}x${s} com.github.unrud.djpdf_${s}.png
    install -Dm644 com.github.unrud.djpdf_${s}.png "$pkgdir"/usr/share/icons/hicolor/${s}x${s}/apps/com.github.unrud.djpdf.png
  done
}
