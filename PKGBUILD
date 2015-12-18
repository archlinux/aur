# Maintainer: Joonatan Saarhelo <joon.saar@gmail.com>
pkgname=phz-ric-git
pkgver=0.1.r0.g62388c7
pkgrel=1
pkgdesc="An image resizing and caching server."
arch=('any')
url=""
license=('GPL')
groups=()
depends=('imagemagick')
makedepends=('go>=1.3.0')
optdepends=()
provides=('phz-ric')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/phzfi/RIC.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/RIC"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir

  export GOPATH=$srcdir
  mkdir -p $GOPATH/src/github.com/phzfi/
  mv $srcdir/RIC $GOPATH/src/github.com/phzfi/

  go get github.com/phzfi/RIC/server
}

check() {
  cd $srcdir

  export GOPATH=$srcdir
  go test github.com/phzfi/RIC/server
}

package() {
  cd $srcdir

  mkdir -p $pkgdir/usr/bin
  mv -T bin/server $pkgdir/usr/bin/phz-ric
}
