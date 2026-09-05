
_pkgname=noctalia-greeter
_tagver=1.3.1
pkgname=noctalia-greeter
pkgver=1.3.1
pkgrel=2
pkgdesc='Minimal greetd login greeter with a bundled wlroots compositor'
arch=('x86_64' 'aarch64')
url='https://github.com/noctalia-dev/noctalia-greeter'
license=('MIT')
options=('!debug')
install=noctalia-greeter.install
depends=(
  'cairo'
  'dbus'
  'fontconfig'
  'freetype2'
  'glib2'
  'glibc'
  'greetd'
  'libglvnd'
  'librsvg'
  'libwebp'
  'libxkbcommon'
  'libxml2'
  'pango'
  'tomlplusplus'
  'wayland'
  'wlroots0.20'
)
makedepends=(
  'meson'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'stb'
  'wayland-protocols'
)
optdepends=(
  'noctalia: Wallpaper and palette sync from Noctalia'
)
provides=('noctalia-greeter')
conflicts=('noctalia-greeter-git' 'noctalia-greeter-bin')
source=("${_pkgname}-${_tagver}.tar.gz::${url}/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('c3a2fce1d15efcf9c87f22b149d03c7dd378f273290c1488190cf8445edbc14d')

build() {
  CXXFLAGS+=" -Wno-unused-result"
  arch-meson "${_pkgname}-${_tagver}" build-release \
    -Db_ndebug=true
  meson compile -C build-release
}

package() {
  meson install -C build-release --destdir "${pkgdir}"

  install -Dm644 "${_pkgname}-${_tagver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_pkgname}-${_tagver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
