# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=remotely
pkgname=$_pkgname-git
pkgver=1.0.r10.g8792370
pkgrel=1
pkgdesc="A GTK3 VNC Client"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gitlab.gnome.org/haecker-felix/Remotely"
license=('GPL3')
depends=('gtk-vnc')
makedepends=('git'
             'meson'
             'vala')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.gnome.org/haecker-felix/Remotely.git")
md5sums=('SKIP')

pkgver() {
  cd Remotely
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  rm -rf build
  arch-meson Remotely build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
