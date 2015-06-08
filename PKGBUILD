# Maintainer: willemw <willemw12@gmail.com>

_pkgname=gdrive
pkgname=$_pkgname-git
pkgver=1.8.0.r1.g385b8b9
pkgrel=1
pkgdesc="Google Drive CLI Client"
arch=('x86_64' 'i686')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
makedepends=('git' 'go' 'mercurial')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip' '!emptydirs')
# 'source' is only used by pkgver() to set the package version
source=($pkgname::git://github.com/prasmussen/gdrive.git)
md5sums=('SKIP')

_gourl=github.com/prasmussen/gdrive

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  GOPATH="$srcdir" go get -d -fix -v -x $_gourl
}

build() {
  cd src/$_gourl
  GOPATH="$srcdir" go build -v -x drive.go
}

#check() {
#  GOPATH="$GOPATH:$srcdir" go test -v -x $_gourl
#}

package() {
  install -Dm755 src/$_gourl/drive "$pkgdir/usr/bin/gdrive"
  install -Dm644 src/$_gourl/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

