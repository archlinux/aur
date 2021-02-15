# Contributor: Sainnhe Park <sainnhe@gmail.com>

pkgname=budgie-pixel-saver-applet-ubuntubudgie-git
pkgver=3.0.1.r24.g8bfe6d1
pkgrel=1
pkgdesc="Pixel Saver applet for Budgie Desktop - UbuntuBudgie's fork"
url='https://github.com/UbuntuBudgie/budgie-pixel-saver-applet'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('budgie-desktop' 'gnome-settings-daemon' 'libpeas' 'libwnck3' 'xorg-xprop')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
conflicts=('budgie-pixel-saver-applet' 'budgie-pixel-saver-applet-git')
install=budgie-pixel-saver-applet.install

source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd budgie-pixel-saver-applet
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/budgie-pixel-saver-applet"
  mkdir -p build
  cd "${srcdir}/budgie-pixel-saver-applet/build"
  meson --prefix /usr --buildtype=plain ..
  ninja
}

package() {
  cd "${srcdir}/budgie-pixel-saver-applet/build"
  DESTDIR="${pkgdir}" ninja install
}
