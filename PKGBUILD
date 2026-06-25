# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor: lotation <xlapsiu@gmail.com>

pkgname=bottles
_pkgname=Bottles
pkgver=64.1
pkgrel=1
epoch=2
pkgdesc='Easily manage wine and proton prefix'
arch=(any)
url="https://github.com/bottlesdevs/Bottles"
license=(GPL-3.0-only)
depends=(
  fvs2
  gtk4
  gtksourceview5
  hicolor-icon-theme
  icoextract
  libadwaita
  libportal-gtk4
  patool
  python
  python-cairo
  python-certifi
  python-chardet
  python-charset-normalizer
  python-gobject
  python-idna
  python-markdown
  python-orjson
  python-pathvalidate
  python-pefile
  python-pycurl
  python-requests
  python-urllib3
  python-yaml
  python-yara
  vkbasalt-cli
)
makedepends=(
  meson
  ninja
  blueprint-compiler
  gobject-introspection
  desktop-file-utils
  appstream-glib
  gettext
  glib2-devel
)
optdepends=(
  'vulkan-tools: vkcube test / Vulkan info'
  'xorg-xdpyinfo: display info detection'
  'imagemagick: icon/image conversion'
  'vmtouch: preload bottle files into memory'
  'mangohud: performance overlay'
  'gamemode: feral gamemode integration'
  'gamescope: gamescope session integration'
  'xterm: fallback terminal for "Run executable in terminal"'
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/bottlesdevs/Bottles/archive/refs/tags/${pkgver}.tar.gz"
  remove-flatpak-checks.patch
)
sha256sums=(
  8d81cc6a3f25675ef15f7ec35fadba247f17634b016be7eead6af536aee8c536
  5b4a8818bdac2bfb46615959f02ef4dc94cfcc30768357ed56e91d15842d0ea7
)

prepare() {
  # Fix warning about flatpak and sandbox environment
  patch --forward --directory="${srcdir}/${_pkgname}-${pkgver}" --strip=1 --input="${srcdir}/remove-flatpak-checks.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  meson setup --prefix='/usr' build
  ninja -C build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: set ft=sh ts=2 sw=2 et:
