# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-command-source
pkgver=0.3.1
pkgrel=1
pkgdesc="This plugin provides a dummy source to execute arbitrary command when scene is switched"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/dummy-source-to-execute-command.952/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("91de532cc851c1f7b4c78a9727497fedc3835ca868700ae4233f592a18b7632b")

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
