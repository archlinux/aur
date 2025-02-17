# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-startpage-bin'
pkgver=2.0.3
pkgrel=1
pkgdesc='This extension protects users from being tracked while allowing them to search the web in complete private mode.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/startpage-private-search/'
license=('GPL-3.0')
depends=('firefox')
_source_file_id=4416483
source=('startpage.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/startpage_private_search-${pkgver}.xpi")
noextract=('startpage.xpi')
sha256sums=('e22fdf5988a8134eef72d963891ab5c662f90a1fc061cd354f60529bd511ae40')

prepare() {
  cd "$srcdir"

  unzip -qqo "startpage.xpi" -d "startpage-${pkgver}"
}

package() {
  _extension_id="$(sed -n 's/.*"id": "\(.*\)".*/\1/p' startpage-${pkgver}/manifest.json)"
  install -Dm644 'startpage.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}.xpi"
}
