# Contributor: Javier ‘Phrodo_00‘ Aravena <phrodo.00@gmail.com>
# Mantainer: iosonofabio Fabio Zanini <fabio.zanini@fastmail.fm>
pkgname=bzr-gtk
pkgver=0.103.0
pkgrel=1
pkgdesc="Plugin for Bazaar that aims to provide GTK+ interfaces to most Bazaar operations."
arch=('i686' 'x86_64')
url="http://bazaar-vcs.org/bzr-gtk"
license=('GPL')
depends=('python2-pygobject2' 'bzr>=2.1' 'bzr<=2.5' 'pycairo' 'libglade')
makedepends=('bzr-stats')
source=("https://launchpad.net/bzr-gtk/gtk3/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('a794ad2faa1f7708a37e3a5885ddf8ca')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Replace python with python2
  for file in $(find ./ -name '*.py' -print); do
      sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
      sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  
  cd "${startdir}/src/${pkgname}-${pkgver}/"
  python2 setup.py build_credits
  python2 setup.py install --prefix'=/usr' --root="${startdir}/pkg"
}

