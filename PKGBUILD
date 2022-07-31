# Maintainer: Artem Senichev <artemsen@gmail.com>
# Contributor: Artem Senichev <artemsen@gmail.com>

pkgname=swayimg
pkgver=1.8
pkgrel=1
pkgdesc='Image viewer for Sway/Wayland'
arch=('x86_64')
license=('MIT')
makedepends=('bash-completion' 'meson' 'wayland-protocols')
depends=(
  'wayland'
  'libxkbcommon'
  'json-c'
  'fontconfig'
  'freetype2'
  'hicolor-icon-theme'
  'libavif'
  'libjxl'
  'librsvg'
  'libwebp'
  'libtiff'
  'libexif'
  )
optdepends=('bash-completion: Bash completions')
url='https://github.com/artemsen/swayimg'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('d82d33a21553efc6d532026eb04b4424')

build() {
  local meson_options=(
    -D avif=enabled
    -D bash=enabled
    -D exif=enabled
    -D gif=enabled
    -D jpeg=enabled
    -D jxl=enabled
    -D svg=enabled
    -D tiff=enabled
    -D webp=enabled
    -D man=true
    -D desktop=true
    -D version=${pkgver}
  )
  arch-meson ${pkgname}-${pkgver} build "${meson_options[@]}"
  meson compile -C build
}

package(){
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
