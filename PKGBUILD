# $Id: PKGBUILD 120737 2014-10-15 18:55:49Z arcanis $
# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ray Rashif <schiv at archlinux dot org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux dot us>
# See .contrib for older/other contributors

pkgname=eric4
pkgver=4.5.25
pkgrel=1
pkgdesc="A full-featured Python 2.x and Ruby IDE in PyQt4"
arch=('any')
url="http://eric-ide.python-projects.org/"
license=('GPL3')
depends=('eric-common' 'python2-qscintilla')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/eric-ide/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
md5sums=('f68cdadacfa10298c89300e0c4036324'
         'bce515b66a2c63dfc76a0f92edbe2ecb')
changelog=ChangeLog

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 install.py -c -b /usr/bin -i "$pkgdir"
  # remove common components
  find "${pkgdir}/usr/share/qt4/qsci/api/" -type f -not -name 'eric*' -exec rm {} \;

  # freedesktop.org compatibility
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 eric/icons/default/eric.png \
                 "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

# vim:set ts=2 sw=2 et:
