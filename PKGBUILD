# Maintainer: Boradorka
# Co-maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=improve-imgsli
_reponame=Improve-ImgSLI
pkgver=8.1.1
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
b2sums=('767c1d7329b3cb38395f27c9a1057a1b5f0152c7d28386efd3f8b952ac2ffeb35be66680d607fdd6f3c20b5492670a67480ceba74aac830e57fc54781872e3c2')

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
