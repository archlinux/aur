# Maintainer: Artem Senichev <artemsen@gmail.com>
# Contributor: Artem Senichev <artemsen@gmail.com>

pkgname=swayimg
pkgver=1.9
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
  'libheif'
  'libjxl'
  'librsvg'
  'libwebp'
  'libtiff'
  'libexif'
  )
optdepends=('bash-completion: Bash completions')
url='https://github.com/artemsen/swayimg'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('f2d31099b54257e5813838b7ecdd8a91')

build() {
  local meson_options=(
    -D heif=enabled
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
