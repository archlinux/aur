# Maintainer: willemw <willemw12@gmail.com>

_pkgname=diodon
pkgname=$_pkgname-git
pkgver=1.8.0.r2.g1d41c18
pkgrel=1
pkgdesc="GTK+ clipboard manager"
arch=('x86_64')
url="https://launchpad.net/diodon"
license=('GPL2')
depends=('dconf' 'desktop-file-utils' 'gconf' 'gtk-update-icon-cache' 'libappindicator3'
         'libgee' 'libpeas' 'libunique' 'libxtst' 'xorg-server-xvfb' 'zeitgeist')
makedepends=('git' 'gobject-introspection' 'intltool' 'libpeas' 'vala')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git+https://git.launchpad.net/diodon)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

