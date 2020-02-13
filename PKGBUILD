# Maintainer: Uwe Grasshoff <aurarchlinux at crazyideas dot de>
pkgname=ironscanner
pkgver=2.0
pkgrel=1
pkgdesc="Collect as much information as possible on a image scanner, run test scan, and send a detailed report to OpenPaper.work."
arch=(any)
url="https://gitlab.gnome.org/World/OpenPaperwork/ironscanner"
license=(GPL3)
depends=(python3)
conflicts=(ironscanner-git)
makedepends=(git python-virtualenv vala gobject-introspection)
_commit=f13633f7383329d587e360e4a09dedee9f2cfcf1  # branch/2.0
source=("git+https://gitlab.gnome.org/World/OpenPaperwork/ironscanner.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$pkgname"
  source ./activate_test_env.sh
  #./configure --prefix=/usr
  make 
}

package() {
  cd "$pkgname"
  make install
  mkdir -p "$pkgdir/usr/bin/"
  cp venv/bin/ironscanner "$pkgdir/usr/bin/"
  #cd "$pkgname-$pkgver"
}
