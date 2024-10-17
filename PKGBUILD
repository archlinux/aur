# Maintainer: Brandon <bmcomis2018@gmail.com>

pkgname=diurnals
pkgver=1.0.2
pkgrel=1
pkgdesc="Receive a daily popup to notify about upcoming Todoist tasks"
arch=(any)
url="https://github.com/SSS-Says-Snek/diurnals"
license=("MIT")
depends=(
  'python-gobject'
  'libadwaita'
  'python-todoist-api-python'
  "python-schedule"
  'python-attrs' # python-todoist-api-python outdated and forgot to include attrs dep
)
makedepends=(
  'git'
  'meson'
)
source=("git+https://github.com/SSS-Says-Snek/diurnals.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  meson setup --prefix=/usr --buildtype=plain "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
