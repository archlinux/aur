# Maintainer: Michael Picht <michael dot picht at ussenterprise dot de>

pkgname=gool-git
_pkgname=gool
pkgver=1.0.2.r1.g05febea
pkgrel=1
pkgdesc='Go - Online TV Recorder on Linux'
arch=('x86_64' 'i686')
url="http://github.com/mipimipi/$_pkgname/"
license=('GPL3')
depends=('mkvtoolnix-cli')
makedepends=('go' 'git')
source=("git://github.com/mipimipi/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export GOPATH=$(pwd)
  mkdir src
  ln -s -r vendor/github.com src/github.com
  ln -s -r vendor/golang.org src/golang.org
}

build() {
  cd "$_pkgname"
  export GOPATH=$(pwd)
  make VERSION=$pkgver
}

package() {
  cd "$_pkgname"
  make DESTDIR=$pkgdir install
}
