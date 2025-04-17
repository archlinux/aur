# Maintainer: Boradorka
# Co-maintainer: Nebulosa

pkgname=improve-imgsli
pkgver=3.1.9
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
sha512sums=('5caf410c1f7d8b269628e70c58aa38c305177e583494c2e32da988ed62c902af74cb9b079fdab478dc590e2a44c530cf8d6b8d3897bd1c8bc2ab052528f35101')
b2sums=('35e57ba1d760e7d0ca1d7e270e7b1e0964d9df2a994f7a65167abe7f831f9c8fcc598cf66df3e5e25c9bfa5d8c461df95c5db875d6755a70034a445b92c81429')

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
