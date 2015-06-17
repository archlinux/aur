# Maintainer:  TDY <tdy@gmx.com>
# Contributor: zhuqin <zhuqin83@gmail.com>

pkgname=terminator-bzr
pkgver=1549
pkgrel=1
pkgdesc="A tool for arranging multiple terminals in a single window"
arch=('i686' 'x86_64')
url="http://www.tenshu.net/terminator/"
license=('GPL')
depends=('hicolor-icon-theme' 'pygtk' 'python2-keybinder2' 'python2-notify'
         'vte' 'xdg-utils')
makedepends=('bzr' 'desktop-file-utils' 'gettext' 'intltool')
optdepends=('gnome-python: gnome-terminal profile support')
provides=('terminator')
conflicts=('terminator')
_pkgname=terminator
source=("${_pkgname}::bzr+http://bazaar.launchpad.net/~gnome-terminator/terminator/trunk/")
md5sums=('SKIP')

install=terminator.install

_bzrtrunk=http://bazaar.launchpad.net/~gnome-terminator/terminator/trunk

pkgver() {
  bzr revno "${srcdir}/${_pkgname}"
}

build() {
  rm -rf "$srcdir/${_pkgname}-build"
  cp -r "$srcdir/${_pkgname}" "$srcdir/${_pkgname}-build"
  cd "$srcdir/${_pkgname}"

  msg "Starting make..."
  find -type f -name '*.py' -exec sed -i '1s,python,&2,' '{}' \;
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-build"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
