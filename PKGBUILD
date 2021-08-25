# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Wesley Moore <wes@wezm.net>
pkgname=tootle
pkgver=1.0
_pkgver=${pkgver//_/-}
pkgrel=4
pkgdesc="GTK3 client for Mastodon"
arch=('x86_64' 'aarch64')
url="https://github.com/bleakgrey/tootle"
license=('GPL3')
depends=(
 'glib2'
 'granite'
 'gtk3'
 'hicolor-icon-theme'
 'json-glib'
 'libhandy'
 'libsoup'
)
optdepends=(
 'noto-fonts-emoji: color emoji'
)
makedepends=(
 'cmake'
 'desktop-file-utils'
 'gnome-common'
 'gobject-introspection'
 'hicolor-icon-theme'
 'intltool'
 'meson'
 'ninja'
 'vala'
 'yelp-tools'
)
options=('!libtool')
source=(
 "https://github.com/bleakgrey/$pkgname/archive/${_pkgver}.tar.gz"
 "Use-reason_phrase-instead-of-get_phrase.patch"
)
sha256sums=('e0a0a062b1b72010242f7bb4db97cd71190f23067188b5c07372264d768a0496'
            '06314649f967661defaf5d847a9ecdf4b942299a08613c4f3087afa6ecf5d7fc')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  patch -p1 < "$startdir/Use-reason_phrase-instead-of-get_phrase.patch"

  arch-meson build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
  ln -s "/usr/bin/com.github.bleakgrey.tootle" "${pkgdir}/usr/bin/tootle"
}
