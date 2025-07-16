# Maintainer: Mark Wagie <mark dot wagie & proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=flowtime
pkgver=6.5
pkgrel=1
pkgdesc="Get what motivates you done, without losing concentration"
arch=('x86_64' 'aarch64')
url="https://github.com/Diego-Ivan/Flowtime"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'libgee'
  'libportal-gtk4'
  'libxml2'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'vala'
)
checkdepends=('appstream-glib')
source=("git+https://github.com/Diego-Ivan/Flowtime.git#tag=v$pkgver")
sha256sums=('c00589598d5ede19365f1d3eb4107df230b4b43951ce4c5d42e19b6ba734d0c0')

build() {
  arch-meson Flowtime build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
