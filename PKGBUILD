# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=fahcontrol
_pkgver=7.6.8-1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Graphical monitor and control utility for the Folding@home client'
url='https://foldingathome.org'
arch=('any')
license=('GPL3')
depends=('python2' 'pygtk')
optdepends=('fahviewer: 3D simulation viewer')
source=("https://download.foldingathome.org/releases/public/release/${pkgname}/debian-stable-64bit/v${_pkgver:0:3}/${pkgname}_${_pkgver}_all.deb")
md5sums=('f893e0f42de97b561b59b418b397502d')

prepare() {
  tar -xf data.tar.xz

  # python2 fixes
  for _file in $(find "${srcdir}/usr/bin/" -name 'FAHControl' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "${_file}"
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "${_file}"
  done
}

package() {
  install -dm755 ${pkgdir}/usr/lib/python2.7/site-packages/fah
  cp -R ${srcdir}/usr/lib/python2.7/dist-packages/fah ${pkgdir}/usr/lib/python2.7/site-packages/
  install -D -m0755 ${srcdir}/usr/bin/FAHControl ${pkgdir}/usr/bin/FAHControl
  install -D -m0644 ${srcdir}/usr/share/pixmaps/FAHControl.png ${pkgdir}/usr/share/pixmaps/FAHControl.png
  install -D -m0644 ${srcdir}/usr/share/applications/FAHControl.desktop ${pkgdir}/usr/share/applications/FAHControl.desktop
}

# vim:set ts=2 sw=2 et:
