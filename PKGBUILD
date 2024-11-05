# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id=io.github.alainm23.planify
pkgver=4.11.6
pkgrel=1
pkgdesc="Task manager with Todoist and Nextcloud support"
arch=('x86_64')
url="https://github.com/alainm23/planify"
license=('GPL-3.0-or-later')
depends=(
  'evolution-data-server'
  'granite7'
  'gtksourceview5'
  'gxml'
  'libadwaita'
  'libportal-gtk4'
  'webkitgtk-6.0'
)
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
  'vala'
)
conflicts=('elementary-planner')
source=("git+https://github.com/alainm23/planify.git#tag=$pkgver")
sha256sums=('17cf13d0a6b42e81b5408b55bcc97ff283b690bc75846639ce8c66150539be72')

build() {
  arch-meson "$pkgname" build -Dprofile=default
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs

  appstreamcli validate --no-net "build/data/${_app_id}.appdata.xml"
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
}
