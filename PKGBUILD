pkgname=flowblade-git
_pkgname=flowblade
pkgver=2.4.0.r1
pkgrel=1
pkgdesc="multitrack non-linear video editor for Linux"
arch=('any')
url="https://github.com/jliljebl/flowblade"
license=('GPL')
depends=('dbus-glib' 'frei0r-plugins' 'gmic' 'gtk3' 'librsvg' 'mlt'
	 'python-mlt'
         'movit' 'pygtk' 'python-dbus' 'pygobject-devel'
         'python-gobject' 'python-numpy' 'python-pillow' 'sdl_image'
         'sox' 'swh-plugins' 'python-cairo' )
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
  python setup.py install --root=$pkgdir/ --install-lib=/usr/share/pyshared --optimize=1
}

