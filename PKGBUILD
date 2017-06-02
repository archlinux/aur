# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: paul2lv [at] gmail dot com

pkgname=fahcontrol-beta
pkgver=7.4.16
pkgrel=1
pkgdesc='A Graphical User Interface (GUI)for Folding@Home - Beta version'
url="http://folding.stanford.edu"
arch=('x86_64')
license=('GPL3')
depends=('gtk2' 'python2' 'pygtk' 'glib2' 'pango' 'foldingathome=${pkgver}')
options=('!docs' '!libtool')
conflicts=('fahcontrol')
provides=('fahcontrol=${pkgver}')
source=(https://folding.stanford.edu/releases/beta/release/fahcontrol/debian-stable-64bit/v7.4/fahcontrol_${pkgver}-1_all.deb)
sha256sums=('6fa229c39ca7c77e64802374ca80289c698112d92b90d5e2bc8d483b8d5a8405')

# Moronic server
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

package() {
  cd ${srcdir}
  tar -xf data.tar.gz

# python2 fixes  
  cd ${srcdir}/usr/bin/
  for _file in $(find . -name 'FAHControl' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "${_file}"
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "${_file}"
   done

  cd ${srcdir}
  install -dm755 ${pkgdir}/usr/lib/python2.7/site-packages/fah
  cp -R ${srcdir}/usr/share/pyshared/fah/ ${pkgdir}/usr/lib/python2.7/site-packages/
  install -D -m0755 ${srcdir}/usr/bin/FAHControl ${pkgdir}/usr/bin/FAHControl
  install -D -m0644 ${srcdir}/usr/share/pixmaps/FAHControl.png ${pkgdir}/usr/share/pixmaps/FAHControl.png
  install -D -m0644 ${srcdir}/usr/share/applications/FAHControl.desktop ${pkgdir}/usr/share/applications/FAHControl.desktop
}

# vim:set ts=2 sw=2 et:
