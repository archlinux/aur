# Maintainer: RoccoDev

pkgname=obs-controller-git
pkgver=0.1.0
pkgrel=1
arch=(x86_64)
pkgdesc="A plugin for obs-studio that allows you to control it over HTTP"
url="https://gitlab.com/Beezig/obs-controller"
license=('GPL3')
depends=("obs-studio")
makedepends=("cargo" "rust" "clang")
conflicts=("obs-controller")
provides=("obs-controller-git=$pkgver")
source=("$pkgname::git+https://gitlab.com/Beezig/obs-controller.git")
md5sums=("SKIP")

pkgver() {
  cd $pkgname
  git rev-parse --short HEAD
}

build() {
  cd $pkgname
  cargo build --release
}

package() {
  mkdir -p $pkgdir/usr/lib/obs-plugins/
  mv $srcdir/$pkgname/target/release/libobs_controller.so $pkgdir/usr/lib/obs-plugins/
}
