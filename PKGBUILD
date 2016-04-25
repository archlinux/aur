# Maintainer: robus
_pkgname=wine-wizard
pkgname=${_pkgname}-git
pkgver=1
pkgrel=1

source=(git+https://github.com/LLIAKAJL/WineWizard.git)
md5sums=('SKIP')

pkgdesc="Modern Wine GUI"
url="http://wwizard.net"
arch=('i686' 'x86_64')
license=('GPLv3')
conflicts=("$_pkgname")
replaces=("$_pkgname")
provides=("$_pkgname=$pkgver")
depends=("qt5-base" "p7zip" "gnupg" "wine")

makedepends=("git")

#pkgver() {
#	cd "./WineWizard"
#	git describe --long | sed -r "s/^${_pkgname%-git}-//;s/([^-]*-g)/r\\1/;s/-/./g"
#}

prepare() {
  mkdir "$srcdir/WineWizard/build"
}

build() {
  cd "$srcdir/WineWizard/build"
  qmake-qt5 "../winewizard.pro" -r -spec linux-g++
  make
}

package() {
  cd "$srcdir/WineWizard/build"
  make INSTALL_ROOT="${pkgdir}" install
}