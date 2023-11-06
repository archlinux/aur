# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=redshift-qt
pkgname=$_pkgname-git
pkgver=0.6.r0.g6724a9f
pkgrel=2
pkgdesc="redshift-gtk rewrite with C++/Qt (latest commit)"
arch=('x86_64' 'i686')
url="https://github.com/Chemrat/redshift-qt"
license=('MIT')
depends=('qt5-base' 'redshift')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i -E "s|Name=Redshift|Name=Redshift Qt|g" $_pkgname/data/$_pkgname.desktop
}

build() {
  cd $_pkgname
  qmake $_pkgname.pro
  make
}

package() {
  cd $_pkgname
  install -Dm644 data/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
}
