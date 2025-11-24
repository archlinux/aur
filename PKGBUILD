# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor: lotation <xlapsiu@gmail.com>

pkgname=bottles
_pkgname=Bottles
pkgver=60.0
pkgrel=1
epoch=2
pkgdesc='Easily manage wine and proton prefix'
arch=(any)
url="https://github.com/bottlesdevs/Bottles"
license=(GPL-3.0-only)
depends=(
  cabextract
  dconf
  gamemode
  gtk4
  gtksourceview5
  hicolor-icon-theme
  icoextract
  imagemagick
  libadwaita
  libportal-gtk4
  p7zip
  patool
  python
  python-chardet
  python-fvs
  python-gobject
  python-markdown
  python-orjson
  python-pathvalidate
  python-pycurl
  python-requests
  python-steamgriddb
  python-yaml
  webkit2gtk
  xorg-xdpyinfo
  vkbasalt-cli
)
optdepends=(
  gvfs 
  lib32-gamemode
  lib32-gnutls
  lib32-vkd3d 
  lib32-vulkan-icd-loader 
  vkd3d
  vulkan-icd-loader
  wine
)
makedepends=(
  blueprint-compiler
  meson
  ninja
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/bottlesdevs/Bottles/archive/refs/tags/${pkgver}.tar.gz"
  remove-flatpak-checks.patch
)
sha256sums=(
  3e0468f9f73f0d96e9a5b366c12b20ba86cbebe1b685f637ec749be1b9f60a9c
  0fadcc38adba5eb4b1a6cb532f638e2d387dd01fabcdd825093a40cdc1e64cf5
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
