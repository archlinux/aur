# Maintainer: stefanwimmer128 <info@stefanwimmer128.xyz>

_pkgname=kf6-servicemenus-rootactions
pkgname=$_pkgname-git
pkgver=1.2.0.r0.g77e1fee
pkgrel=1
pkgdesc='Allows admin users to perform several root only actions from dolphin via polkit agent.'
arch=(any)
url='https://gitlab.com/stefanwimmer128/kf6-servicemenus-rootactions'
license=(GPL-2.0-or-later)
depends=(dolphin kdialog perl polkit)
makedepends=(git)
optdepends=(kate)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.com/stefanwimmer128/kf6-servicemenus-rootactions.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname" || exit
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "$_pkgname" || exit

  ./bootstrap
  ./configure --prefix=/usr
}

build() {
  cd "$_pkgname" || exit

  make
}

check() {
  cd "$_pkgname" || exit

  make check
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
}
