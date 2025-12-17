# Maintainer: dragoneki <dragoneki at proton dot me>

pkgname=bazaar-git
_pkgname=bazaar
pkgver=0.6.3.r5.g0768995
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
  'libsecret'
  'libsoup3'
  'libxmlb'
  'libyaml'
  'md4c'
  'pango'
  'webkitgtk-6.0'
)
makedepends=('blueprint-compiler' 'git' 'glib2-devel' 'meson' 'ninja')
optdepends=('krunner-bazaar: krunner integration')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "bazaar::git+https://github.com/kolunmi/bazaar.git"
)
sha256sums=('SKIP')

pkgver() {
  cd bazaar
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd bazaar
  meson setup --prefix=/usr --buildtype=release build
  ninja -C build
}

package() {
  cd bazaar
  DESTDIR="$pkgdir" meson install -C build
}
