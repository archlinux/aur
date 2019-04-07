# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: Farhad Shahbazi <farhad@enthusiasm.cc>

pkgname=puddletag
pkgver=1.2.0
pkgrel=2
pkgdesc='An audio tag editor for GNU/Linux'
url='https://docs.puddletag.net/'
license=('GPL3')
arch=('any')
depends=('chromaprint' 'python2-mutagen' 'python2-configobj' 'python2-musicbrainz2'
         'python2-pyparsing' 'python2-pyqt4')
optdepends=('python2-pillow: FLAC cover art'
            'quodlibet: QuodLibet library support')
source=("puddletag-${pkgver}.tar.gz::https://github.com/keithgg/puddletag/archive/v${pkgver}.tar.gz")
sha256sums=('95e4867fd04c5349f19de1b5f3c1f2336d3b66da08c076fb175ef8f7589dc80d')

prepare() {
  cd puddletag-${pkgver}/source
  sed -i 's|^#!.*python$|#!/usr/bin/python2|' $(grep -rl '^#!.*python')
}

build() {
  cd puddletag-${pkgver}/source
  python2 setup.py config
}

package() {
  cd puddletag-${pkgver}/source
  python2 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
