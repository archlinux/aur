pkgname=fahcontrol
pkgver=7.4.4
pkgrel=2
pkgdesc='A Graphical User Interface (GUI)for Folding@Home'
url="http://folding.stanford.edu/English/HomePage"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk2' 'python2' 'pygtk' 'glib2' 'pango')
options=('!docs' '!libtool')
source=(https://fah-web.stanford.edu/file-releases/public/release/fahcontrol/debian-testing-64bit/v7.4/fahcontrol_7.4.4-1_all.deb)
md5sums=('f8278d80824d7da65c5b34136a18a0de')

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
