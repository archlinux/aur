# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-command-source
pkgver=0.3.0
pkgrel=1
pkgdesc="This plugin provides a dummy source to execute arbitrary command when scene is switched"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/dummy-source-to-execute-command.952/"
license=("GPL2")
depends=("obs-studio<28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("044bd34eb57e09bda2a6caea7a2c85981633ced905c33cb176b73d5879be044e")

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
  make -C build DESTDIR="$pkgdir/" install
}
