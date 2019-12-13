pkgname=flowblade-git
_pkgname=flowblade
pkgver=2.0.r15.ga3bd40b4
pkgrel=1
pkgdesc="multitrack non-linear video editor for Linux"
arch=('any')
url="https://github.com/jliljebl/flowblade"
license=('GPL')
depends=('dbus-glib' 'frei0r-plugins' 'gmic' 'gtk3' 'librsvg' 'mlt' 
         'mlt-python-bindings' 'movit' 'pygtk' 'python2-dbus'
         'python2-gobject' 'python2-numpy' 'python2-pillow' 'sdl_image'
         'sox' 'swh-plugins')
makedepends=('git')
conflicts=('flowblade' 'flowblade-hg')
provides=('flowblade')
source=(git+https://github.com/jliljebl/${_pkgname})
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

package() {
  cd "${_pkgname}/${_pkgname}-trunk"
  python2 setup.py install --root=$pkgdir/ --install-lib=/usr/share/pyshared --optimize=1
}

