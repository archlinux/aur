# Maintainer: Luca Weiss <WEI16416 (at) spengergasse (dot) at>

pkgname=redshift-qt-git
_pkgname=redshift-qt
pkgver=0.2.r10.g20f92c3
pkgrel=1
pkgdesc="redshift-gtk rewrite with C++/Qt"
arch=('x86_64' 'i686')
url="https://github.com/Chemrat/redshift-qt"
license=('MIT')
depends=('redshift')
makedepends=('qt5-base')
optdepends=()
provides=('redshift-qt')
conflicts=('redshift-qt')
source=("git+https://github.com/Chemrat/redshift-qt.git"
        "redshift-qt.desktop")
md5sums=('SKIP'
         '9ef24b824bcfb46dbd951074af074772')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  qmake redshift-qt.pro
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 redshift-qt $pkgdir/usr/bin/redshift-qt
  install -Dm644 $srcdir/redshift-qt.desktop $pkgdir/usr/share/applications/redshift-qt.desktop
}

# vim:set ts=2 sw=2 et:
