# Maintainer: robus
_pkgname=wine-wizard
pkgname=${_pkgname}-git
pkgver=2.0.0
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
depends=("qt5-base" "bzip2" "cabextract" "tar" "unzip" "wget")

makedepends=("git")

pkgver() {
	cd "./WineWizard"
    git describe --abbrev=0 --tags
}

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