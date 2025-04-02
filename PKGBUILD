# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=thunar
pkgname=${_pkgname}-devel
pkgver=4.21.0
pkgrel=1
pkgdesc='File manager for Xfce (development version)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
url='https://thunar.xfce.org'
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libgudev'
         'libexif' 'libnotify' 'libpng' 'libxfce4ui>=4.21.0' 'libxfce4util')
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
sha256sums=('3f9bd698ab9dc14e63102cdb9853c48d3fc5b1b9753bfec47b8643d2f472b99e')

build() {
  local meson_options=(
    -D gtk-doc=true
    -D gudev=enabled
    -D exif=enabled
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
