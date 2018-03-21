# Maintainer: Semyon Maryasin <simeon@maryasin.name>

pkgname=docker-volume-gc-storage-git
_gitname="docker-volume-gc-storage"
pkgver=0.0.1.751a752
_pkgver=0.0.1
pkgrel=1
pkgdesc='Docker Volume Plugin for Google Cloud Storage (Buckets)'
arch=(i686 x86_64)
url='https://github.com/craimbert/docker-volume-gc-storage'
license=()
depends=("gcsfuse")
makedepends=('git' 'go')
provides=("docker-volume-gc-storage")
conflicts=("docker-volume-gc-storage")
#source=(git://github.com/craimbert/docker-volume-gc-storage)
source=(git://github.com/MarSoft/docker-volume-gc-storage)
sha1sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  echo "$_pkgver.$(git log --pretty=format:"%h" | head -n1)"
}

build() {
  cd $srcdir/$_gitname
  export GOPATH=$PWD/.gopath
  echo Fetching deps...
  go get -v -d
  echo Building...
  go build
}

package() {
  cd $srcdir/$_gitname
  install -Dm755 $_gitname "${pkgdir}/usr/bin/$_gitname"
  #install -Dm644 "support/systemd/lib/systemd/system/$_gitname.service" "${pkgdir}/usr/lib/systemd/system/$_gitname.service"
}
