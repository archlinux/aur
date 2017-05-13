# Maintainer: willemw <willemw12@gmail.com>

_pkgname=diodon
pkgname=$_pkgname-bzr
pkgver=r534
pkgrel=1
pkgdesc="GTK+ clipboard manager"
arch=('any')
url="https://launchpad.net/diodon"
license=('GPL2')
depends=('dconf' 'desktop-file-utils' 'gconf' 'gtk-update-icon-cache' 'libappindicator3'
         'libgee' 'libpeas' 'libunique' 'libxtst' 'xorg-server-xvfb' 'zeitgeist')
makedepends=('bzr' 'gobject-introspection' 'intltool' 'libpeas' 'vala')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::bzr+https://code.launchpad.net/diodon/trunk)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd $pkgname
  # Comment out the following lines to enable the build tests
  rm -rf tests/*
  touch tests/wscript_build
}

build() {
  cd $pkgname
  python2 ./waf configure --prefix=/usr    # --disable-indicator-plugin
  python2 ./waf build
}

package() {
  cd $pkgname
  python2 ./waf install --destdir="$pkgdir/"
}

