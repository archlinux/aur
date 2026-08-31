
_pkgname=noctalia-greeter
_tagver=1.3.0
pkgname=noctalia-greeter
pkgver=1.3.0
pkgrel=1
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
sha256sums=('e5b8c3ff4b8acadf3760c359e3c7cb655ff92b202c0759f95a34e61012ffcdc5')

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
