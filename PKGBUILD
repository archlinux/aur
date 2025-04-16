# Maintainer: Boradorka
# Co-maintainer: Nebulosa

pkgname=improve-imgsli
pkgver=3.1.5
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
sha512sums=('b41a6a99797ad2b2b67742db5d57e38976145e0c22e8ad33afa936cfcbfc23ccd5e0fa6f98a3eb84a8f384aaf22887ec6e0248d862dfff18430fe579dcec1a0b')
b2sums=('61d8e8f6a7f8ba31d29ef242b27d4a1bcaec99586b2a17ffe95bc1cae41f4a3159db546f27dd88a479781db893af69e2578abddb8a1e194794c397ce0f23e3a8')

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
  install -vDm 644 icons.py                               -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 translations.py                        -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 settings_dialog.py                     -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 font/SourceSans3-Regular.ttf           -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 ../build/AUR-template/$pkgname.desktop -t "$pkgdir"/usr/share/applications/
  install -vDm 644 icons/icon.png                            "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
  install -vDm 644 ../LICENSE.txt                            "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
