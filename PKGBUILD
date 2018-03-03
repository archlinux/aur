# Maintainer: Michael Picht <michael dot picht at ussenterprise dot de>

pkgname=smsync-git
_pkgname=smsync
pkgver=1.2.1
pkgrel=1
pkgdesc='smsync (Smart Music Sync) is an easy-to-use command line application for Linux. It helps to keep huge music collections in sync and is also taking care of conversions between different formats'
arch=('x86_64' 'i686')
url="http://github.com/mipimipi/$_pkgname/"
license=('GPL3')
depends=('ffmpeg' 'lame')
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
