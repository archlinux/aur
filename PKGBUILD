# Maintainer: James Clarke <james@jamesdavidclarke.com>
pkgname=appanvil-git
pkgver=r619.2df0101
pkgrel=1
pkgdesc="A graphical user interface for the AppArmor security module"
arch=('x86_64')
url="https://github.com/jack-ullery/AppAnvil"
license=('GPL')
depends=('gtkmm3' 'jsoncpp' 'apparmor' 'libappanvil-git')
makedepends=('git' 'cmake')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/AppAnvil"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/AppAnvil"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

package() {
  cd "$srcdir/AppAnvil/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$startdir/appanvil.desktop" "$pkgdir/usr/share/applications/appanvil.desktop"
}
