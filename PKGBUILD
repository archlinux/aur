# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=honeybadger-git
pkgver=0718a8f
pkgrel=1
pkgdesc="TCP attack inquisitor and 0-day catcher devices"
arch=('any')
url="http://github.com/david415/honeybadger"
license=(GPL)
makedepends=('go')
provides=('honeybadger')
source=('git+https://github.com/david415/honeybadger')
sha1sums=('SKIP')
_gitname=honeybadger

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  export GOPATH=$srcdir
  mkdir -p "$GOPATH/src"
  mv "$srcdir/$_gitname" "$GOPATH/src"

  cd "$GOPATH/src/$_gitname/cmd/honeyBadger"
  go get -v ./...
  go install -v

  cd "$GOPATH/src/$_gitname/cmd/sprayInjector"
  go get -v ./...
  go install -v

  cd "$GOPATH/src/$_gitname/cmd/handshakeHijacker"
  go get -v ./...
  go install -v
}

package() {
  install -Dm755 "$srcdir/bin/honeyBadger" "$pkgdir/usr/bin/honeyBadger"
  install -Dm755 "$srcdir/bin/sprayInjector" "$pkgdir/usr/bin/sprayInjector"
  install -Dm755 "$srcdir/bin/handshakeHijacker" "$pkgdir/usr/bin/handshakeHijacker"
}

# vim:set ts=2 sw=2 et:
