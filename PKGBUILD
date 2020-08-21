# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: paul2lv [at] gmail dot com

pkgname=fahcontrol-beta
pkgver=7.6.17
pkgrel=1
pkgdesc='A Graphical User Interface (GUI) for Folding@Home - Beta version'
url="https://foldingathome.org"
arch=('x86_64')
license=('GPL3')
depends=('gtk2' 'python2' 'pygtk' 'glib2' 'pango' 'foldingathome-beta')
options=('!docs' '!libtool')
conflicts=('fahcontrol')
provides=('fahcontrol')
source=(https://download.foldingathome.org/releases/beta/release/fahcontrol/debian-stable-64bit/v7.6/fahcontrol_${pkgver}-1_all.deb)
sha256sums=('86ab09633032e22e8d92e337f6a0dd4bf781d77d589cc421e6edf4848f8f493f')

package() {
  cd ${srcdir}
  tar -xf data.tar.xz

# python2 fixes  
  cd ${srcdir}/usr/bin/
  for _file in $(find . -name 'FAHControl' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "${_file}"
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "${_file}"
   done

  cd ${srcdir}
  install -dm755 ${pkgdir}/usr/lib/python2.7/site-packages/fah
  cp -R ${srcdir}/usr/lib/python2.7/dist-packages/* ${pkgdir}/usr/lib/python2.7/site-packages/
  install -D -m0755 ${srcdir}/usr/bin/FAHControl ${pkgdir}/usr/bin/FAHControl
  install -D -m0644 ${srcdir}/usr/share/pixmaps/FAHControl.png ${pkgdir}/usr/share/pixmaps/FAHControl.png
  install -D -m0644 ${srcdir}/usr/share/applications/FAHControl.desktop ${pkgdir}/usr/share/applications/FAHControl.desktop
  install -D -m0644 ${srcdir}/usr/share/doc/fahcontrol/changelog.Debian.gz ${pkgdir}/usr/share/doc/fahcontrol/changelog.Debian.gz
}
