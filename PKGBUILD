# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>

_pkgbase=quodlibet
pkgname=exfalso
pkgver=3.4.1
pkgrel=1
pkgdesc="GTK+ audio tag editor"
arch=('any')
url="https://quodlibet.readthedocs.org/"
license=('GPL2')
depends=('mutagen' 'gtk3' 'python2-gobject' 'python2-cairo')
makedepends=('intltool' 'gettext')
#optdepends=('cddb-py: for "CDDB Lookup" plugin'
#             'python2-musicbrainz2: for "MusicBrainz Lookup" plugin')
conflicts=('quodlibet')
install=exfalso.install
_base_src="${_pkgbase}-${pkgver}.tar.gz"
_base_url="https://bitbucket.org/lazka/${_pkgbase}-files/raw/default/releases"
source=("${_base_url}/${_base_src}" "${_base_url}/${_base_src}.sig")
_checksum="$(curl -s "${_base_url}/${_base_src}.sha256" | cut -d " " -f1)"
sha256sums=("${_checksum}" 'SKIP')
validpgpkeys=('0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC') # Christoph Reiter

build () {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  python2 setup.py build
}

package_exfalso() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  python2 setup.py install --root="${pkgdir}"

  # Remove Quod Libet
  rm    "${pkgdir}"/usr/bin/${_pkgbase}
  rm    "${pkgdir}"/usr/share/appdata/${_pkgbase}.appdata.xml
  rm    "${pkgdir}"/usr/share/applications/${_pkgbase}.desktop
  rm -r "${pkgdir}"/usr/share/dbus-1/
  rm -r "${pkgdir}"/usr/share/gnome-shell/
  rm    "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/${_pkgbase}.png
  rm    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${_pkgbase}.svg
  rm    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${_pkgbase}-symbolic.svg
  rm    "${pkgdir}"/usr/share/man/man1/${_pkgbase}.1
  rm    "${pkgdir}"/usr/share/pixmaps/${_pkgbase}.png

  # Remove Plugins
  rm -r "${pkgdir}"/usr/lib/python2.7/site-packages/${_pkgbase}/ext/
}
