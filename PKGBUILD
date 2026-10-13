# Maintainer: dragoneki <dragoneki at proton dot me>

pkgname=bazaar-git
_pkgname=bazaar
pkgver=0.9.7.r27.gcb1d58f
pkgrel=1
pkgdesc="A new app store for GNOME with focus on flatpaks, particularly Flathub. (git version)"
arch=('x86_64')
url="https://gitlab.gnome.org/World/bazaar"
license=('GPL-3.0-or-later')
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
  'gtksourceview5'
  'json-glib'
  'libadwaita'
  'libdex'
  'libheif'
  'libmalcontent'
  'libproxy'
  'libsecret'
  'libsoup3'
  'systemd-libs'
  'libxmlb'
  'libyaml'
  'md4c'
  'pango'
  'webkitgtk-6.0'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'glib2-devel'
  'libxml2'
  'meson'
  'ninja'
  'python-babel'
  'vala'
)
optdepends=('krunner-bazaar: krunner integration' 'malcontent: parental controls')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.gnome.org/World/bazaar.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson setup "${_pkgname}" build \
    --prefix=/usr \
    --buildtype=plain
  meson compile -C build
}

# check() {
#   meson test -C build --print-errorlogs
# }

package() {
  meson install -C build --destdir "${pkgdir}"
}
