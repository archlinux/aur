# Maintainer: Gregory Petrosyan <gregory.mkv at gmail.com>
pkgname=connman-gtk-git
pkgver=v1.1.1.r11.gb72c6ab
pkgrel=1
pkgdesc="Tray menu and GUI for connman"
arch=('i686' 'x86_64')
url="https://github.com/jgke/connman-gtk"
license=('GPL')
depends=('glib2' 'gtk3')
makedepends=('intltool' 'meson' 'git' 'openconnect')
optdepends=('openconnect: Easier authentication to AnyConnect VPNs')
conflicts=('connman-gtk')
install=$pkgname.install
source=("git+https://github.com/jgke/connman-gtk.git")
sha256sums=('SKIP')

build() {
  mkdir build
  meson --prefix /usr --buildtype=plain -Duse_openconnect=dynamic "${srcdir}/connman-gtk" build
  ninja -C build
}

pkgver() {
  cd connman-gtk
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

