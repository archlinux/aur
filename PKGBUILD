# Maintainer:
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname="vala-panel"
pkgname="$_pkgname"
pkgver=24.05
pkgrel=2
pkgdesc="Panel for compositing window managers"
url="https://gitlab.com/vala-panel-project/vala-panel"
license=('LGPL-3.0-only')
arch=('x86_64')

depends=(
  'gtk-layer-shell'
  'gtk3'
  'libwnck3'

  ## implicit
  #at-spi2-core
  #cairo
  #dconf
  #gdk-pixbuf2
  #glib2
  #hicolor-icon-theme
  #pango
)
makedepends=(
  'git'
  'meson'
  'vala'
  'gobject-introspection'
)

conflicts=(
  'appmenu-glib-translator-git'
  'vala-panel-appmenu-budgie-git'
  'vala-panel-appmenu-common-git'
  'vala-panel-appmenu-jayatana-git'
  'vala-panel-appmenu-mate-git'
  'vala-panel-appmenu-registrar-git'
  'vala-panel-appmenu-valapanel-git'
  'vala-panel-appmenu-xfce-git'
  'vala-panel-git'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  local _meson_options=(
    -Dwnck=enabled
    -Dplatforms=x11,wayland
  )

  arch-meson build "$_pkgsrc" "${_meson_options[@]}"
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
