# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=madonctl-git
_pkgname=madonctl
pkgver=r205.c8a7bb3
pkgrel=1
pkgdesc="Golang command line interface for the Mastodon API"
arch=('any')
url="https://github.com/McKael/madonctl"
license=('MIT')
makedepends=('go' 'git' 'fakeroot')
options=('!strip')
source=($_pkgname::git+https://github.com/McKael/madonctl.git)
md5sums=('SKIP')
_gourl=github.com/McKael/madonctl

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH=$srcdir 
  go get -u $_gourl
}

package() {
  install="madonctl-git.install"
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 $srcdir/bin/madonctl "$pkgdir/usr/bin"
}

