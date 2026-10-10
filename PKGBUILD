# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=thunar
pkgname=${_pkgname}-devel
pkgver=4.21.7
pkgrel=1
pkgdesc='File manager for Xfce (development version)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
url='https://thunar.xfce.org'
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libgudev'
         'libgexiv2' 'libnotify' 'libpng' 'libxfce4ui>=4.21.8' 'xfce4-session>=4.21.2' 'vte3')
makedepends=('meson' 'xfce4-dev-tools' 'xfce4-panel' 'gtk-doc' 'gobject-introspection')
optdepends=('gvfs: trash support, mounting with udisks, and remote filesystems'
            'xfce4-panel: trash applet'
            'tumbler: for thumbnail previews'
            'thunar-volman: manages removable devices'
            'thunar-archive-plugin: create and deflate archives'
            'thunar-media-tags-plugin: view/edit id3/ogg tags'
            'catfish: file search')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('fcb196b2f89cbcb8a3f5130fa9a1a11bc49d66a6403bc91aff7676648d95d51f')

build() {
  local meson_options=(
    -D gtk-doc=true
    -D gudev=enabled
    -D gexiv2=enabled
    -D tests=false
    -D terminal=enabled
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
