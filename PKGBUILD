# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=remotely
pkgname=$_pkgname-git
pkgver=r8.8b5f629
pkgrel=2
pkgdesc="A GTK3 VNC Client"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gitlab.gnome.org/haecker-felix/Remotely"
license=('GPL3')
depends=('gtk-vnc')
makedepends=('gtk-vnc'
             'meson'
             'vala')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.gnome.org/haecker-felix/Remotely.git")
md5sums=('SKIP')

pkgver() {
  cd Remotely
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  rm -rf build
  arch-meson Remotely build
  ninja -v -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
