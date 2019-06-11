# Maintainer: willemw <willemw12@gmail.com>

_pkgname=gdrive
pkgname=$_pkgname-git
pkgver=2.0.1.r3.g401e017
pkgrel=1
pkgdesc="Google Drive CLI Client"
arch=('x86_64' 'i686')
url="https://github.com/gdrive-org/gdrive"
license=('MIT')
makedepends=('git' 'go')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip' '!emptydirs')
source=($pkgname::git://github.com/prasmussen/gdrive.git)
md5sums=('SKIP')

_gourl=github.com/prasmussen/gdrive

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  GOPATH="$srcdir/build" go get -fix -v -x $_gourl
}

#check() {
#  GOPATH="$srcdir/build" go test -fix -v -x $_gourl
#}

package() {
  cd build
  install -Dm755 bin/gdrive "$pkgdir/usr/bin/gdrive"
}

