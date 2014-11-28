# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>

pkgname=specto-bzr
pkgver=126
pkgrel=1
pkgdesc="A desktop application that will watch configurable events."
arch=('i686' 'x86_64')
url="http://code.launchpad.net/specto"
license=('GPL2')
depends=('python-notify' 'gnome-python-extras' 'dbus-python' 'pygtk' 'gnome-icon-theme')
makedepends=('bzr' 'librsvg')
conflicts=('specto' 'specto-svn')
provides=('specto')

source=()
md5sums=()

_bzrbranch=https://code.launchpad.net/~specto/specto/main
_bzrmod=specto

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./$_bzrmod ]; then
    bzr co $_bzrbranch $_bzrmod -r ${pkgver}
  else
    bzr up $_bzrmod
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./$_bzrmod-build ] && rm -fr ./$_bzrmod-build
  cp -r ./$_bzrmod ./$_bzrmod-build

  cd ./$_bzrmod-build
  python setup.py install --prefix=/usr --root=${pkgdir} || return 1

  rm -rf ${srcdir}/$_bzrmod-build
}
