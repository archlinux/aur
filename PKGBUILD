# Maintainer: Artem Senichev <artemsen@gmail.com>
# Contributor: Artem Senichev <artemsen@gmail.com>

pkgname=swayimg
pkgver=1.4
pkgrel=2
pkgdesc='Image viewer for Sway/Wayland'
arch=('x86_64')
license=('MIT')
makedepends=('bash-completion' 'meson' 'wayland-protocols')
depends=(
  'wayland'
  'libxkbcommon'
  'json-c'
  'hicolor-icon-theme'
  'libavif'
  'librsvg'
  'libwebp'
  )
optdepends=('bash-completion: Bash completions')
url='https://github.com/artemsen/swayimg'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('56f256e9031c3d98f8d4c0f61cb9eca6')

build() {
  local meson_options=(
    -D jpeg=enabled
    -D gif=enabled
    -D svg=enabled
    -D webp=enabled
    -D avif=enabled
    -D bash=enabled
    -D man=true
    -D desktop=true
  )
  arch-meson ${pkgname}-${pkgver} build "${meson_options[@]}"
  meson compile -C build
}

package(){
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
