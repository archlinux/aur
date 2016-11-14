# Contributor: kaptoxic(at)yahoo-dot-com
pkgname=gphotoframe-git
pkgver=1.5.r158.gcc27a65
pkgrel=2
pkgdesc="A photo frame gadget for the GNOME Desktop"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gphotoframe/"
license=('GPL3')
groups=()
depends=('pygtk' 'twisted' 'pyxdg' 'python2-gdata' 'python2-oauth' 'python2-pyopenssl')
makedepends=('python2-distutils-extra')
optdepends=('python2-simplejson' 'python2-feedparser' 'python2-clutter' 
'gnome-python-desktop')
conflicts=('gphotoframe')
options=()
source=('gphotoframe::git+https://github.com/iblis17/gphotoframe.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gphotoframe"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/gphotoframe"
  python2 setup.py install --prefix=$pkgdir/usr/ || return 1
  gconf-merge-schema gphotoframe.schemas
}
