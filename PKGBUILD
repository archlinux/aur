# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=gfeeds
_pkgname=gnome-feeds
pkgver=0.16.1
pkgrel=1
pkgdesc='An RSS/Atom feed reader for GNOME'
arch=('x86_64')
url="https://gabmus.gitlab.io/${_pkgname}"
license=('GPL3')
depends=('appstream' 'python-html5lib' 'webkit2gtk' 'python-gobject' 'python-pillow' 'python-feedparser' 'python-listparser' 'python-lxml' 'python-readability-lxml' 'libhandy' 'python-dateutil' 'python-pytz' 'python-beautifulsoup4' 'python-pygments')
makedepends=('meson' 'gobject-introspection')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${pkgname}-git")
source=("https://gitlab.com/gabmus/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('11f150fa7fb743ded928db29efd8abcf59f068237cf3b27bc60061719b47a55c')

prepare () {
  cd "${_pkgname}-${pkgver}"

  mkdir build
}

build () {
  cd "${_pkgname}-${pkgver}/build"

  meson --prefix=/usr ..
  ninja
}

package () {
  cd "${_pkgname}-${pkgver}/build"

  DESTDIR="${pkgdir}" ninja install
}
