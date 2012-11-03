# Contributor: Javier ‘Phrodo_00‘ Aravena <phrodo.00@gmail.com>
# Mantainer: iosonofabio Fabio Zanini <fabio.zanini@fastmail.fm>
pkgname=bzr-gtk
pkgver=0.104.0
pkgrel=1
pkgdesc="Plugin for Bazaar that aims to provide GTK+ interfaces to most Bazaar operations."
arch=('any')
url="http://bazaar-vcs.org/bzr-gtk"
license=('GPL')
depends=('python2>=2.4' 'python2-gobject2' 'bzr>=2' 'bzr<3')
optdepends=(
    'python2-cairo: Graphs in the visualisation tool'
    'pygtksourceview2: Syntax-highlighted diffs'
    'python2-nautilus: Nautilus integration'
    # 'pywin32: Olive'
)
makedepends=('bzr-stats')
source=("https://launchpad.net/bzr-gtk/gtk3/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('5e6694b57662c338d5eb2d85d4cd2357')

source+=(bzr_handle_patch_open_display.patch bzr_notify_open_display.patch)
md5sums+=(
  '384f7ad2131b581342566fa78d041c85'
  '3aaf3786033d97f488425aa718d7d314'
)

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
