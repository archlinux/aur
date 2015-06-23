# Maintainer: sxe <sxxe@gmx.de>

pkgname=flowblade-git
_pkgname=flowblade
pkgver=r795.391edb3
pkgrel=1
pkgdesc="a multitrack non-linear video editor for Linux"
arch=('any')
url="https://github.com/jliljebl/flowblade"
license=('GPL')
depends=( 'ffmpeg' 'pygtk' 'mlt-python-bindings' 'ladspa' 'sox' 'frei0r-plugins' 'python2-gnomevfs' 'python2-numpy' 'python2-dbus' 'python2-imaging')
makedepends=('git')
conflicts=('flowblade' 'flowblade-hg')
provides=('flowblade')

install=flowblade.install
source=('git+https://github.com/jliljebl/flowblade')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd $srcdir/$_pkgname/${_pkgname}-trunk
  python2 setup.py install --root=$pkgdir/ --install-lib=/usr/share/pyshared --optimize=1
}

