# Maintainer: AlexDevFlow <107987666+AlexDevFlow@users.noreply.github.com>
# Contributor: cypress-exe
#
# Stable package: tracks tagged GitHub releases. The tag-triggered release
# workflow (.github/workflows/release.yml) sets `pkgver` and pushes this to
# the AUR automatically. For the bleeding edge see `fileconverter-git`.
pkgname=fileconverter
pkgver=1.4.1
pkgrel=1
pkgdesc="Right-click file conversion for your Linux file manager (ffmpeg / ImageMagick / LibreOffice)"
arch=('any')
url="https://github.com/AlexDevFlow/Media-Converter"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-yaml'
  'ffmpeg'
  'imagemagick'
)
optdepends=(
  'python-gobject: GTK progress and settings windows'
  'gtk4: GTK progress and settings windows'
  'libadwaita: GTK progress and settings windows'
  'tk: fallback GUI when GTK is unavailable'
  'ghostscript: PDF processing'
  'libreoffice-still: document conversions (docx, xlsx, pptx, epub, ...)'
  'python-nautilus: right-click menu in Nautilus (GNOME)'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlexDevFlow/Media-Converter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1da6af081add865325fb4ebdb4573f3ab96b0bd431cbaf50d75ab05f8bf92c93')

build() {
  cd "Media-Converter-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "Media-Converter-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# After installing, set up the right-click menu for your file manager with:
#   fileconverter --install
# and remove it later with:
#   fileconverter --uninstall
