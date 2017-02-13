# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>

_pkgbase=quodlibet
pkgname=exfalso
pkgver=3.8.1
pkgrel=1
pkgdesc="GTK+ audio tag editor"
arch=('any')
url="https://${_pkgbase}.readthedocs.io/"
license=('GPL2')
depends=('mutagen' 'gtk3' 'python2-gobject' 'python2-cairo' 'python2-futures')
makedepends=('intltool' 'gettext')
#optdepends=('python2-musicbrainzngs: for "MusicBrainz Lookup" plugin')
conflicts=("${pkgbase}")
source=("https://bitbucket.org/lazka/${_pkgbase}-files/raw/default/releases/${_pkgbase}-${pkgver}.tar.gz"{,.sig})
sha256sums=('ad92660aa10b7464d445a694224fb35b54ed7b800f7a54a5f27c63951d839417' 'SKIP')
validpgpkeys=('0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC') # Christoph Reiter

build () {
  cd ${_pkgbase}-${pkgver}

  python2 setup.py build
}

package_exfalso() {
  cd ${_pkgbase}-${pkgver}

  python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1

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
