# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>

pkgname=photini-git
pkgver=v2016.10.0.r1.g00ccc63
pkgrel=1
pkgdesc='An easy to use digital photograph metadata (EXIF, IPTC, XMP) editing application'
arch=('any')
url='https://github.com/jim-easterbrook/Photini'
license=('GPL')
depends=(
hicolor-icon-theme
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
pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}
package(){
  cd "$srcdir"/$_gitname
#   sed '142 s/^ /#/' -i setup.py
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
