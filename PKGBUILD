# Maintainer: lmartinez-mirror
# Maintainer: Artem Senichev <artemsen@gmail.com>
# Contributor: Artem Senichev <artemsen@gmail.com>

_pkgname=swayimg
pkgname=${_pkgname}-git
pkgver=1.4
pkgrel=2
pkgdesc='Image viewer for Sway/Wayland'
arch=('x86_64')
license=('MIT')
makedepends=(
  'git'
  'bash-completion'
  'meson'
  'wayland-protocols'
  )
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
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/artemsen/swayimg'
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

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
  arch-meson ${_pkgname} build "${meson_options[@]}"
  meson compile -C build
}

package(){
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 ${_pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${_pkgname}/
}
