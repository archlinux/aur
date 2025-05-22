# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >
# Maintainer: Cimu Wang <cimu58@gmail.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Robert Cegliński <rob.ceglinski@gmail.com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-clearurls'
pkgver=1.27.3
pkgrel=3
pkgdesc="Remove tracking elements from URL's."
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/clearurls/"
license=('LGPL-3.0')
depends=('firefox')
_source_file_id=4432106
source=("clearurls.xpi::https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/clearurls-${pkgver}.xpi")
noextract=('clearurls.xpi')
sha256sums=('54926b6e4274d5935a5fc0daa6320f1d371e3d2f1a5877467ca3ab22a65c4f20')

prepare() {
  cd "$srcdir"
  unzip -qqo "clearurls.xpi" -d "clearurls-${pkgver}"
}

package() {
  _extension_id="$(sed -n 's/.*"id": "\(.*\)".*/\1/p' "${srcdir}"/clearurls-${pkgver}/manifest.json)"
  install -Dm644 'clearurls.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}.xpi"
}
