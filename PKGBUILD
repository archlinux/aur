# Maintainer: <stormdragon2976@gmail.com>
# Contributer: Ondrej Kipila <ok100@openmailbox.org>

pkgname=lyvi-git
_gitname=lyvi
pkgver=v2.0.0.20.g7cc7a3f.g7cc7a3f
pkgrel=3
pkgdesc="Command-line lyrics, guitar tabs, and artist information viewer"
url="http://ok100.github.io/lyvi/"
arch=(any)
license=('WTFPLv2')
depends=('python-glyr-git' 'python-pillow' 'python-psutil' 'python-urwid')
optdepends=('python-dbus: mpris support'
            'python-gobject: mpris support')
makedepends=('git' 'python-pip')
source=('git+git://github.com/ok100/lyvi.git')
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed 's|-|.|g').g$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_gitname"
  sed -i 's/from pip.req import parse_requirements/from pip._internal.req import parse_requirements/' setup.py
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
