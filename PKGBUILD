# Maintainer: Gotar <gotar@users.noreply.github.com>
pkgname=wallpicker
pkgver=2.3.1
pkgrel=1
pkgdesc="Modern GTK4/Libadwaita wallpaper picker with Wallhaven integration and AI upscaling"
arch=('any')
url="https://github.com/gotar/WallPicker"
license=('MIT')
depends=(
  'python>=3.11'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'python-requests'
  'python-pillow'
  'python-send2trash'
  'python-aiohttp'
  'python-rapidfuzz'
)
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
optdepends=('awww: Animated wallpaper transitions'
            'waifu2x-ncnn-vulkan: AI upscaling for local wallpapers')
source=("${pkgname}::git+https://github.com/gotar/WallPicker.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install Python package
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Install desktop entry
  install -Dm644 wallpicker.desktop "${pkgdir}/usr/share/applications/wallpicker.desktop"

  # Install icon
  install -Dm644 data/wallpaper-icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wallpicker.svg"

  # Install CSS stylesheet
  install -Dm644 data/style.css "${pkgdir}/usr/share/wallpicker/style.css"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
