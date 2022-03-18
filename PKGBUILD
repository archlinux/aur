# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=baobab
pkgname=${_pkgname}-gtk3
pkgver=41.0
pkgrel=1
pkgdesc="A graphical directory tree analyzer (last GTK3 version)"
url="https://wiki.gnome.org/Apps/DiskUsageAnalyzer"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL2')
depends=('dconf' 'gtk3' 'gsettings-desktop-schemas' 'librsvg' 'libhandy')
makedepends=('vala' 'gobject-introspection' 'yelp-tools' 'appstream-glib' 'meson')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://gitlab.gnome.org/GNOME/baobab/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
        'no-mimetype.diff')
sha256sums=('5e3892f0abb87152b3cc48899b1f00960a5b72fcaad662bd357ae405c6ac8e7a'
            '958a85fe3a2001d16ebcf71b51888f260508af87224a0de3410a6bbe685e59d0')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # https://bugs.archlinux.org/task/31861
  patch -Np1 -i ../no-mimetype.diff
}

build() {
  arch-meson "${_pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
