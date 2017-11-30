# Maintainer: Scott Dickson <scottfoesho@gmail.com>

pkgname=plexdrive
pkgver=5.0.0
pkgrel=1
pkgdesc='Plexdrive allows you to mount your Google Drive account as read-only fuse filesystem, with direct delete option on the filesystem.'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/dweidenfeld/plexdrive'
license=('MIT')
depends=('fuse')
makedepends=('go')
conflicts=("plexdrive-bin" "plexdrive-git" "plexdrive-dev-git")
source=(https://github.com/dweidenfeld/plexdrive/archive/5.0.0.tar.gz)
md5sums=('4babdf453fd969776a4e3480079ec698')
_goroot='/usr/lib/go'

build() {
  mkdir -p plexdrive/src/github.com/dweidenfeld/plexdrive
  cd plexdrive
  export GOROOT="$_goroot"
  GOPATH=$PWD && export GOPATH
  mv ../plexdrive-${pkgver}/main.go .
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
