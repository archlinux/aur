# Maintainer: Michael Picht <michael dot picht at ussenterprise dot de>

pkgname=smsync-git
_pkgname=smsync
pkgver=2.0.1
pkgrel=1
pkgdesc="smsync (Smart Music Sync) keeps huge music collections in sync and is taking care of conversions between different file formats. It's an easy-to-use command line application for Linux."
arch=('x86_64' 'i686')
url="http://github.com/mipimipi/$_pkgname/"
license=('GPL3')
depends=('ffmpeg')
makedepends=('go' 'git' 'sudo')
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
