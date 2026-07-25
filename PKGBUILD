# Maintainer: Noctalia Team <team@noctalia.dev>

_pkgname=noctalia
_tagver=5.0.0-beta.5
pkgname=noctalia
pkgver=5.0.0_beta.5
pkgrel=1
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
sha256sums=('1460781135969e9a8985c2c7343131df69f5b8595e8428cfdc416f85585b9447')

build() {
  CXXFLAGS+=" -Wno-unused-result"
  arch-meson "${_pkgname}-${_tagver}" build-release \
    -Db_ndebug=true \
    -Dnative_optimizations=true \
    -Dtests=disabled
  meson compile -C build-release
}

package() {
  meson install -C build-release --destdir "${pkgdir}"

  install -Dm644 "${_pkgname}-${_tagver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_pkgname}-${_tagver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
