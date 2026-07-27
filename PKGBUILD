# Maintainer: Noctalia Team <team@noctalia.dev>

_pkgname=noctalia
_tagver=5.0.0-beta.6
pkgname=noctalia
pkgver=5.0.0_beta.6
pkgrel=2
pkgdesc='A sleek, customizable desktop shell crafted for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/noctalia-dev/noctalia'
license=('MIT')
options=('!debug')
depends=(
  'cairo'
  'curl'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'git'
  'glib2'
  'glibc'
  'jemalloc'
  'libglvnd'
  'libjxl'
  'libpipewire'
  'libqalculate'
  'librsvg'
  'libsecret'
  'libsodium'
  'libwebp'
  'libwireplumber'
  'libxkbcommon'
  'libxml2'
  'md4c'
  'pam'
  'polkit'
  'pango'
  'sdbus-cpp'
  'tomlplusplus'
  'wayland'
)

makedepends=(
  'meson'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'stb'
  'wayland-protocols'
)
conflicts=('noctalia-git' 'noctalia-bin')
source=("${_pkgname}-${_tagver}.tar.gz::${url}/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('f20391942b635e8750dff6e37748d86562d51d6f9be62befc5495787ffe93dc8')

build() {
  CXXFLAGS+=" -Wno-unused-result"
  arch-meson "${_pkgname}-${_tagver}" build-release \
    -Db_ndebug=true \
    -Dtests=disabled
  meson compile -C build-release
}

package() {
  meson install -C build-release --destdir "${pkgdir}"

  install -Dm644 "${_pkgname}-${_tagver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_pkgname}-${_tagver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
