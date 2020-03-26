# Maintainer: Axel Gembe <derago@gmail.com>

pkgname=plexdrive
pkgver=5.0.0
pkgrel=1
pkgdesc='Plexdrive allows you to mount your Google Drive account as read-only fuse filesystem, with direct delete option on the filesystem.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='https://github.com/dweidenfeld/plexdrive'
license=('MIT')
depends=('fuse')
makedepends=('go')
conflicts=("plexdrive-bin" "plexdrive-git" "plexdrive-dev-git" "plexdrive-mongodb" "plexdrive-mongodb-bin" "plexdrive-sqlite" "plexdrive-sqlite-bin")
source=(https://github.com/dweidenfeld/plexdrive/archive/5.0.0.tar.gz)
sha256sums=('68763993a3da3d8ccd0dc18b3a5db7ab7ad8d03fde2d9be2ef4829e8356225bd')
_goroot='/usr/lib/go'

build() {
  mkdir -p plexdrive/src/github.com/dweidenfeld/plexdrive
  cd plexdrive
  export GOROOT="$_goroot"
  GOPATH=$PWD && export GOPATH
  cp ../plexdrive-${pkgver}/*.go .
	mv ../plexdrive-${pkgver}/* src/github.com/dweidenfeld/plexdrive
  go get bazil.org/fuse
  go get github.com/boltdb/bolt
  go get google.golang.org/api/googleapi
  go get golang.org/x/sys/unix
  go get github.com/ogier/pflag
  go get github.com/claudetech/loggo
  go get golang.org/x/net/context
  go get golang.org/x/oauth2
  go build
}

package() {
  install -d ${pkgdir}/usr/bin
  install -Dm755 ${srcdir}/plexdrive/plexdrive ${pkgdir}/usr/bin/
}
