# Maintainer: FFY00 <filipe.lains@gmail.cm>

pkgname=budgie-brightness-applet-git
pkgver=0.2.r0.0cad740
pkgrel=1
pkgdesc="Screen brightness applet for Budgie Desktop"
arch=('i686' 'x86_64')
url='https://github.com/ilgarmehmetali/budgie-brightness-control-applet'
license=('GPL2')
sha256sums=('SKIP')
provides=('budgie-brightness-applet')
conflicts=('budgie-brightness-applet')
depends=('libpeas' 'budgie-desktop' 'gnome-settings-daemon') 
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
source=("git+${url}")

pkgver() {
  cd "$srcdir/budgie-brightness-control-applet"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

build() {
  mkdir -p "$srcdir/budgie-brightness-control-applet/build"
  cd "$srcdir/budgie-brightness-control-applet/build"

  meson .. \
    --prefix /usr \
    --buildtype=plain

  ninja
}

package() {
  cd "${srcdir}/budgie-brightness-control-applet/build"

  DESTDIR="${pkgdir}" ninja install
}
