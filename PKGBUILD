# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=fahcontrol
pkgver=7.6.13
pkgrel=1
pkgdesc='Graphical monitor and control utility for the Folding@home client'
url='https://foldingathome.org'
arch=('any')
license=('GPL3')
depends=('python2' 'pygtk')
optdepends=('fahviewer: 3D simulation viewer')
source=("https://download.foldingathome.org/releases/public/release/${pkgname}/debian-stable-64bit/v${pkgver%.*}/${pkgname}_${pkgver}-1_all.deb")
md5sums=('6747c8780feefe37778586f74a1c61d2')

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
