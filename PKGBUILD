# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>

pkgname=photini-git
pkgver=v2016.10.0.r0.g4cc4454c
pkgrel=2
pkgdesc='An easy to use digital photograph metadata (EXIF, IPTC, XMP) editing application'
arch=('any')
url='https://github.com/jim-easterbrook/Photini'
license=('GPL')
depends=(
libgexiv2
python2-appdirs
python2-gobject2
python2-sip
)
optdepends=(
'python2-flickrapi: Upload to Flickr'
'python2-gdata: Upload to Picasa'
'gphoto2: access to camera'
)
makedepends=(git python2)
source=('git://github.com/jim-easterbrook/Photini.git')
md5sums=('SKIP')
_gitname='Photini'

pkgver() {
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/Photini.//'
  fi
}
package(){
  cd "$srcdir"/$_gitname
  sed '142 s/^ /#/' -i setup.py
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
