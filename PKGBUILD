# Maintainer: Grant Handy <grantshandy AT gmail DOT com>

_pkgname='gtktranslate'
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A Simple GTK Translator Using Libretranslate"
arch=('x86_64')
url="https://github.com/skylinecc/gtktranslate"
license=('GPL')
depends=('gtk4')
makedepends=('rust' 'git')
source=("icons.zip::https://github.com/grantshandy/gtktranslate/releases/download/${pkgver}/icons.zip"
        "gtktranslate::https://github.com/grantshandy/gtktranslate/releases/download/${pkgver}/gtktranslate.x86_64"
        "gtktranslate.desktop::https://github.com/grantshandy/gtktranslate/releases/download/${pkgver}/gtktranslate.desktop")
md5sums=('fbab51f018bc07fb19fc78a0cd9bf268'
        '72db99846d373f74a828b1802558f8b6'
        'bcc3a97d41533386165ca3a5960deab2')

package() {
  cd $srcdir

  # Binary
  install -Dm755 gtktranslate $pkgdir/usr/bin/$_pkgname

  # Icons
  for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
      echo copying icon ${i}
      install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$i/apps/${_pkgname}.png" "icons/$i/gtktranslate.png"
  done

  # Pixmap
  install -Dm0644 "icons/128x128/gtktranslate.png" "$pkgdir/usr/share/pixmaps/gtktranslate.png"

  # Desktop file
  install -Dm0644 -t "$pkgdir/usr/share/applications" "gtktranslate.desktop"
}
