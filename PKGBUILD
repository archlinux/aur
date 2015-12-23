# Maintainer: Gus deMayo <gus@thegusproject.xyz>

pkgname=tunesviewer
pkgver=1.5.3
pkgrel=1
pkgdesc="TunesViewer is a small, easy to use program to access iTunes-university media and podcasts in Linux."
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/tunesviewer/"
options=('!strip')

source=("http://iweb.dl.sourceforge.net/project/tunesviewer/${pkgname}_${pkgver}.deb")
sha1sums=('92f756ea12acce46f76008da88413edb8546ec50')

depends=("python2" "pygtk" "python2-lxml" "pywebkitgtk")
optdepends=("soundconverter" "vlc" "python2-notify" "python2-support")

package() {
  tar xvfJ data.tar.xz
  mkdir -p $pkgdir/usr/share
  cd $srcdir/usr
  rm -Rf doc
  rm -Rf man
  rm -Rf python-support
  perl -pi -w -e 's/env python/env python2/g;' tunesviewer/*.py
  cd ..
  cp -r usr $pkgdir
  chmod -R 755 $pkgdir/usr/bin/tunesviewer
  chmod -R 755 $pkgdir/usr/share/applications/TunesViewer.desktop
  chmod -R 755 $pkgdir/usr/share/tunesviewer
}