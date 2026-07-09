# Maintainer: Boradorka
# Co-maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=improve-imgsli
_reponame=Improve-ImgSLI
pkgver=9.0.0
pkgrel=2
pkgdesc="Image comparison tool with magnifying glass feature"
arch=(any)
url="https://github.com/Loganavter/$pkgname"
license=(MIT)
depends=(
  hicolor-icon-theme
  python
  python-dbus
  python-numpy
  python-opengl
  python-pillow
  python-pyqt6
  python-scikit-image
  python-sli-ui-toolkit
  sh
)
optdepends=(
  'ffmpeg: for session recording, timeline, and video export'
  'python-imagecodecs: JXL image format support'
  'python-snakeviz: for performance profiling'
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('f8d13c101a62e873a0429a8b50117a94a40a2dd0ac4cfd6b767711000221e2e99420fc14b7943febb285e3483a9ab573f9efda37c7de2c9fbbf96f34ccef7afc')

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
