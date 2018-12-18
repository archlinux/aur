# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-pixel-saver-applet-git
pkgver=v4.0.0.r10.g30c1f94
pkgrel=1
pkgdesc="Pixel Saver applet for Budgie Desktop"
url='https://github.com/ilgarmehmetali/budgie-pixel-saver-applet'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('budgie-desktop' 'gnome-settings-daemon' 'libpeas' 'libwnck3' 'xorg-xprop')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
install=budgie-pixel-saver-applet.install

source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd budgie-pixel-saver-applet
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
