# Maintainer: Artem Senichev <artemsen@gmail.com>
# Contributor: Artem Senichev <artemsen@gmail.com>

_pkgname=swayimg
pkgname=${_pkgname}-git
pkgver=5.5
pkgrel=1
pkgdesc='Image viewer for Wayland'
arch=('x86_64')
license=('MIT')
makedepends=(
  'bash-completion'
  'git'
  'meson'
  'wayland-protocols'
  )
depends=(
  'exiv2'
  'fontconfig'
  'freetype2'
  'hicolor-icon-theme'
  'libavif'
  'libheif'
  'libjxl'
  'libraw'
  'librsvg'
  'libsixel'
  'libtiff'
  'libwebp'
  'libxkbcommon'
  'luajit'
  'openexr'
  'openjpeg2'
  'wayland'
  )
optdepends=('bash-completion: Bash completions')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/artemsen/swayimg'
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long --always | sed 's/-g.*//;s/^v//;s/-/./'
}

build() {
  arch-meson ${_pkgname} build --auto-features=enabled -D version=${pkgver}
  meson compile -C build
}

package(){
  meson install -C build --destdir "${pkgdir}"
}
