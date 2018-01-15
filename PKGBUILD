# Maintainer: Gus deMayo <gus@thegusproject.xyz>

pkgname=tunesviewer
pkgver=2.1
pkgrel=1
pkgdesc="TunesViewer is a small, easy to use program to access iTunes-university media and podcasts in Linux."
arch=('any')
url="http://sourceforge.net/projects/tunesviewer/"
options=('!strip')

source=("https://sourceforge.net/projects/$pkgname/files/${pkgname}_$pkgver.deb")
sha256sums=('84dd7d5a859616bb8ef0f30050e06a7260f107706261d12f0d1cfbeca4f1c3b2')

depends=("python2" "pygtk" "python2-lxml" "python2-gobject" "python2-contextlib2")

package() {
  tar xvfJ data.tar.xz
  mkdir -p $pkgdir/usr/share
  cd $srcdir/usr
  rm -Rf share/doc
  rm -Rf share/man
  rm -Rf share/python-support
  cd $srcdir/usr/share/tunesviewer
  perl -pi -w -e 's/env python/env python2/g;' *.py
  cd $srcdir	
  cp -r usr $pkgdir
  chmod -R 755 $pkgdir/usr/bin/tunesviewer
  chmod -R 755 $pkgdir/usr/share/applications/TunesViewer.desktop
  chmod -R 755 $pkgdir/usr/share/tunesviewer
}
