# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Uwe Grasshoff <aurarchlinux at crazyideas dot de>
pkgname=ironscanner
pkgver=2.0+33+g148792b
pkgrel=1
pkgdesc="Collect as much information as possible on a image scanner, run test scan, and send a detailed report to OpenPaper.work."
arch=(any)
url="https://gitlab.gnome.org/World/OpenPaperwork/ironscanner"
license=(GPL3)
depends=(python3)
makedepends=(git python-virtualenv vala gobject-introspection)
_commit=148792bacfed010e12ae79a7407757c894f66583  # master/3. February 2020
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
