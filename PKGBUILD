# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=redshift-qt
pkgname=$_pkgname-git
pkgver=0.6.r0.g6724a9f
pkgrel=1
pkgdesc="redshift-gtk rewrite with C++/Qt (latest commit)"
arch=('x86_64' 'i686')
url="https://github.com/Chemrat/redshift-qt"
license=('MIT')
depends=('qt5-base' 'redshift')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git"
        "$_pkgname.desktop")
md5sums=('SKIP'
         '9ef24b824bcfb46dbd951074af074772')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  qmake $_pkgname.pro
  make
}

package() {
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  cd $_pkgname
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
}
