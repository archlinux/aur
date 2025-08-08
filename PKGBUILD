# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor:Limao Luo <luolimao+AUR@gmail.com>

_pkgname=tumbler
pkgname=${_pkgname}-git
pkgver=4.21.0+10+gfd32d11
pkgrel=1
pkgdesc="D-Bus service for applications to request thumbnails (git checkout)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://docs.xfce.org/xfce/tumbler/start"
license=('GPL-2.0-or-later')
groups=('xfce4-git')
depends=('gdk-pixbuf2' 'libxfce4util')
makedepends=('ffmpegthumbnailer' 'freetype2' 'libgsf' 'libopenraw' 'poppler-glib'
             'libgepub' 'xfce4-dev-tools' 'git' 'glib2-devel' 'meson' 'gtk-doc')
optdepends=('ffmpegthumbnailer: for video thumbnails'
            'poppler-glib: for PDF thumbnails'
            'libgsf: for ODF thumbnails'
            'libopenraw: for RAW thumbnails'
            'freetype2: for font thumbnails'
            'libgepub: for epub thumbnails')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::git+https://gitlab.xfce.org/xfce/tumbler.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D gtk-doc=true
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
