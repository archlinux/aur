# Maintainer: dragoneki <dragoneki at proton dot me>

pkgname=bazaar-git
_pkgname=bazaar
pkgver=0.7.13.r83.g98f4a39
pkgrel=1
pkgdesc="A new app store for GNOME with focus on flatpaks, particularly Flathub. (git version)"
arch=('x86_64')
url="https://github.com/kolunmi/bazaar"
license=('GPL-3.0-only')
depends=(
  'appstream'
  'cairo'
  'dconf'
  'flatpak'
  'glib2'
  'glycin'
  'glycin-gtk4'
  'graphene'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libdex'
  'libmalcontent'
  'libproxy'
  'libsecret'
  'libsoup3'
  'libxmlb'
  'libyaml'
  'md4c'
  'pango'
  'webkitgtk-6.0'
)
makedepends=('blueprint-compiler' 'git' 'glib2-devel' 'meson' 'python-babel' 'ninja')
optdepends=('krunner-bazaar: krunner integration')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "bazaar::git+https://github.com/kolunmi/bazaar.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson setup "${_pkgname}" build --prefix=/usr --buildtype=release
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
