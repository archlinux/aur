# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

_pkgname=lastfmplaycount
pkgname=rhythmbox-${_pkgname}-git
pkgver=0.r1.9e75b31
pkgrel=1
pkgdesc="A Rhythmbox plugin that fetches the currently playing track's playcount from Last.fm"
url="https://github.com/BramBonne/LastfmPlaycount"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('rhythmbox')
install=rhythmbox-${_pkgname}.install
md5sums=('SKIP')
source=(${_pkgname}::git+https://github.com/BramBonne/LastfmPlaycount.git)

pkgver() {
  cd ${srcdir}
  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p "${pkgdir}/usr/share/glib-2.0/schemas"
  cp org.gnome.rhythmbox.plugins.lastfmplaycount.gschema.xml \
    "${pkgdir}/usr/share/glib-2.0/schemas"

  mkdir -p "${pkgdir}/usr/lib/rhythmbox/plugins/${_pkgname}"
  cp * "${pkgdir}/usr/lib/rhythmbox/plugins/${_pkgname}"
}
