# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Wesley Moore <wes@wezm.net>
pkgname=tootle
pkgver=1.0_alpha2
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="GTK3 client for Mastodon"
arch=('x86_64')
url="https://github.com/bleakgrey/tootle"
license=('GPL3')
depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'granite' 'json-glib')
optdepends=('noto-fonts-emoji: color emoji')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja' 'vala')
options=('!libtool')
source=("https://github.com/bleakgrey/$pkgname/archive/${_pkgver}.tar.gz")
sha256sums=('7094adf37a177782a0cfc9c4d951a96e646bd496a74ac7e121b8c67e710d9199')

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
