# Maintainer: Boradorka
# Co-maintainer: Nebulosa

pkgname=improve-imgsli
pkgver=2.6.3
pkgrel=1
pkgdesc="Image comparison tool with magnifying glass feature"
arch=(any)
url="https://github.com/Loganavter/$pkgname"
license=(MIT)
depends=(
  hicolor-icon-theme
  python
  python-pillow
  python-pyqt6
  python-pyqt6-sip
  sh
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('e592abf7868ab5cc9d2ab580357c741a832f4a43b92a50f449a46807523f24a586236963b5bcb1ec5070389498a4aa47e845ab0b1329eb8ff0d90b33a2a8f068')
b2sums=('6274bcfef01423cbe036756757cac1d23f9b3bb3541db441f0ade5c46f1d5798ac4bbb9f6924bd34a5b098136256cd40b27191664829bb11d5914fed60364d14')

prepare() {
  #Making launching app more secure
  sed -i "s|^Exec=$pkgname|Exec=/usr/bin/$pkgname|" "$srcdir"/Improve-ImgSLI-$pkgver/build/AUR-template/$pkgname.desktop
}

package() {
  cd "$srcdir/Improve-ImgSLI-$pkgver/src"
  install -vDm 755 ../build/launcher.sh                      "$pkgdir"/usr/bin/$pkgname
  install -vDm 644 Improve_ImgSLI.py                      -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 clickable_label.py                     -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 image_comparison_app.py                -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 image_processing.py                    -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 flag_icons.py                          -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 translations.py                        -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 font/SourceSans3-Regular.ttf           -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 ../build/AUR-template/$pkgname.desktop -t "$pkgdir"/usr/share/applications/
  install -vDm 644 icons/icon.png                            "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
  install -vDm 644 ../LICENSE.txt                            "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
