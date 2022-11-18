# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>

_pkgbase=snapd-glib
pkgbase=snapd-glib-git
pkgname=snapd-glib-git
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=( 'libsoup' 'json-glib')
pkgver=1.63.r1.gba68fa1
pkgrel=1
arch=('x86_64')
url="https://github.com/snapcore/snapd-glib"
license=('GPL3')
makedepends=('git'  'libsoup' 'json-glib' 'qt5-declarative' 'qt5-base' 'glib2' 'gtk-doc' 'autoconf' 'pkg-config' 'automake' 'libtool')
conflicts=($_pkgbase)
options=('!strip' 'emptydirs')
source=("git+https://github.com/snapcore/$_pkgbase.git")
sha256sums=('SKIP')

provides=($_pkgbase)


pkgver() {
    cd "$srcdir/snapd-glib"
    git describe --tag | sed -r 's/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd "$_pkgbase"
    meson _build --prefix=/usr
    ninja -C _build install
#  ./autogen.sh --disable-silent-rules --enable-gtk-doc --prefix=/usr
#   make $MAKEFLAGS
}

package_snapd-glib-git() {
    cd "$_pkgbase"
    meson _build --prefix=/usr
    ninja -C _build install
#   make install DESTDIR="$pkgdir"
}
