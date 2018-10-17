# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>

pkgbase=snapd-glib
pkgname=snapd-glib
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=( 'libsoup' 'json-glib')
pkgver=1.44
pkgrel=1
arch=('x86_64')
url="https://github.com/snapcore/snapd-glib"
license=('GPL3')
makedepends=('git'  'libsoup' 'json-glib' 'qt5-declarative' 'qt5-base' 'glib2' 'gtk-doc' 'autoconf' 'pkg-config' 'automake' 'libtool')
conflicts=($pkgbase)
options=('!strip' 'emptydirs')
source=("https://github.com/snapcore/$pkgbase/archive/$pkgver.tar.gz")
sha256sums=('ecc87b677bd7f8a64fab7b98deb35a37f8d6d1e986eb62f5b0a6142cc89b2e1e')

provides=($pkgbase)

build() {
  cd "$pkgbase-$pkgver"
 ./autogen.sh --disable-silent-rules --enable-gtk-doc --prefix=/usr
  make $MAKEFLAGS
}

package_snapd-glib() {
  cd "$pkgbase-$pkgver"
  make install DESTDIR="$pkgdir"
}
