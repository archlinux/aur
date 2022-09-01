# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-multisource-effect
pkgver=0.2.1
pkgrel=1
pkgdesc="This is a simple source providing custom effect to render multiple sources"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/multi-source-effect.1412/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("0cb241f2948225b7d82a1381e289768ff0788c81bee2d55b1e3f27198501b1d8")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF

  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir" install
}
