# Maintainer: sfslinux@gmail.com

pkgname=image-gtk
pkgver=23.5
pkgrel=1
pkgdesc="A simple, fast and elegant image viewer program"
arch=('x86_64')
url="https://github.com/vl-nix/image-gtk"
license=('GPL3')
depends=('gtk3' )
makedepends=('meson')
source=(https://github.com/vl-nix/image-gtk/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('a23005d4f7998922a63e395b901aff4c249bf905742806c5703366388d3a8fda')
install=$pkgname.install

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/meson.add_install_script*/#meson.add_install_script*/' data/meson.build
}

build() {
  cd $pkgname-$pkgver
  meson build --prefix /usr --strip
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" meson install -C build
}
