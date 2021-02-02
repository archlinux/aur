# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Wesley Moore <wes@wezm.net>
pkgname=tootle
pkgver=1.0
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="GTK3 client for Mastodon"
arch=('x86_64' 'aarch64')
url="https://github.com/bleakgrey/tootle"
license=('GPL3')
depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'granite' 'json-glib')
optdepends=('noto-fonts-emoji: color emoji')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja' 'vala')
options=('!libtool')
source=("https://github.com/bleakgrey/$pkgname/archive/${_pkgver}.tar.gz")
sha256sums=('e0a0a062b1b72010242f7bb4db97cd71190f23067188b5c07372264d768a0496')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  arch-meson build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
  ln -s "/usr/bin/com.github.bleakgrey.tootle" "${pkgdir}/usr/bin/tootle"
}
