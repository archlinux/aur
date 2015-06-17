# Submitter: Carlos Eduardo Moreira dos Santos (cemsbr) <cems at domain cemshost.com.br>
# Mantainer: iosonofabio Fabio Zanini <fabio.zanini@fastmail.fm>

pkgname=bzr-stats
pkgver=0.1.0+bzr51
pkgrel=1
pkgdesc="Simple statistics plugin for Bazaar."
arch=('i686' 'x86_64')
url="http://launchpad.net/bzr-stats"
license=('GPL')
depends=('bzr')

source=(https://launchpad.net/debian/wheezy/+source/${pkgname}/${pkgver}-1/+files/${pkgname}_${pkgver}.orig.tar.bz2)
md5sums=('8a02f3bd22f1c9a37f1ded89151639c9')

iprepare() {
  cd "${srcdir}/${pkgname}_${pkgver}.orig"
  # Replace python with python2
  for file in $(find ./ -name '*.py' -print); do
      sed -i 's,^#!.*/usr/bin/python,#!/usr/bin/python2,g' $file
      sed -i 's,^#!.*/usr/bin/env.*python,#!/usr/bin/env python2,g' $file
  done
}

build() {
  cd "${srcdir}/${pkgname}_${pkgver}.orig"
  python2 ./setup.py install --prefix=/usr --root="${pkgdir}" -O1
}
