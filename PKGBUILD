# Maintainer: Boradorka
# Co-maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=improve-imgsli
_reponame=Improve-ImgSLI
pkgver=8.1.0
pkgrel=1
pkgdesc="Image comparison tool with magnifying glass feature"
arch=(any)
url="https://github.com/Loganavter/$pkgname"
license=(MIT)
depends=(
  ffmpeg
  hicolor-icon-theme
  python
  python-markdown
  python-numpy
  python-pillow
  python-opengl
  python-pyqt6
  python-scikit-image
)
optdepends=(
  'python-desktop-notifier: enhanced system notifications'
  'python-imagecodecs: JXL image format support'
  'python-snakeviz: for performance profiling'
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('bb17bd2e2841066e6a398a99080ac25d26cc373e8a2ab8b7c2a24d7bb2db79d8262be0fde36a950beaa6f0f356f9c7782b979bb43010abd2977a0a6daae7fe7c')

prepare() {
  cd "$_reponame-$pkgver"
  #Making launching app more secure
  sed -i "s|^Exec=|Exec=/usr/bin/|" "$srcdir"/Improve-ImgSLI-$pkgver/build/AUR-template/$pkgname.desktop
}

package() {
  cd "$_reponame-$pkgver"
  install -vDm 755 build/AUR-template/launcher.sh         "$pkgdir"/usr/bin/$pkgname
  install -vDm 644 build/AUR-template/$pkgname.desktop -t "$pkgdir"/usr/share/applications/
  install -vDm 644 src/resources/icons/icon.png           "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
  install -vDm 644 LICENSE                             -t "$pkgdir"/usr/share/licenses/$pkgname/
  cd "src"
  find . -type f -exec install -vDm 644 "{}"              "$pkgdir/usr/lib/$pkgname/{}" \;
}
