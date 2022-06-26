# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=palette
pkgver=2.0.2
_commit=01ce37b3e262574ad7594b5e5b906b7aacd2ab81
pkgrel=1
pkgdesc='Tool for viewing the GNOME color palette as defined by the design guidelines'
arch=('x86_64' 'aarch64')
url='https://gitlab.gnome.org/World/design/palette'
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=(
  "git+$url.git#commit=$_commit"
  "git+https://gitlab.gnome.org/Teams/Design/HIG-app-icons.git")
b2sums=(
  'SKIP'
  'SKIP')

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.hig.url $srcdir/HIG-app-icons
  git submodule update
}

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
