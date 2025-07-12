# Maintainer: dragoneki <dragoneki at proton dot me>
pkgname=bazaar-git
_pkgname=bazaar
pkgver=0.0.0.r339.g078cdc2
pkgrel=1
pkgdesc="A new app store for GNOME with focus on flatpaks, particularly Flathub. (git version)"
arch=('x86_64')
url="https://github.com/kolunmi/bazaar"
license=('GPL-3.0-only')
depends=(
  'gtk4'
  'libadwaita'
  'libdex'
  'flatpak'
  'appstream'
  'libxmlb'
  'glycin'
  'libyaml'
  'libsoup3'
  'json-glib'
  'glib2'
  'pango'
  'hicolor-icon-theme'
  'graphene'
  'dconf'
  'cairo'
)
makedepends=('meson' 'ninja' 'gcc' 'pkgconf' 'git' 'glib2-devel')
optdepends=('krunner-bazaar: krunner integration')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Generate pkgver from latest commit hash, e.g. 0.0.0.r123.gabcdef0
  printf "0.0.0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  meson setup build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" ninja -C build install
}
