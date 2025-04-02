# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=tumbler
pkgname=${_pkgname}-devel
pkgver=4.21.0
pkgrel=1
pkgdesc="D-Bus service for applications to request thumbnails"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/tumbler/start"
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
depends=('gdk-pixbuf2' 'libxfce4util')
makedepends=('meson' 'glib2-devel' 'ffmpegthumbnailer' 'poppler-glib' 'libgsf'
             'libopenraw' 'freetype2' 'libgepub')
optdepends=('ffmpegthumbnailer: for video thumbnails'
            'poppler-glib: for PDF thumbnails'
            'libgsf: for ODF thumbnails'
            'libopenraw: for RAW thumbnails'
            'freetype2: for font thumbnails'
            'libgepub: for epub thumbnails')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=('etc/xdg/tumbler/tumbler.rc')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('794b3da6b0665c59dea97dcfe307de0f7f5207b1ce4490b57b379b2571609b35')

build() {
  local meson_options=(
    -D gtk-doc=true
    -D gst-thumbnailer=disabled
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}


package() {
  meson install -C build --destdir "$pkgdir"
}
