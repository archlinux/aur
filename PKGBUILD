# Maintainer: zimbatm <zimbatm@zimbatm.com>
pkgname=direnv
pkgver=2.20.1
pkgrel=2
pkgdesc='a shell extension that manages your environment'
arch=('x86_64' 'i686' 'armv7h')
url='http://direnv.net'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/direnv/direnv/archive/v$pkgver.tar.gz")

gopackagepath=github.com/direnv/direnv

prepare() {
  [[ -f /etc/profile.d/go.sh ]] && source /etc/profile.d/go.sh
  export GOPATH=$srcdir/go

  mkdir -p "$GOPATH/src/$(dirname "$gopackagepath")"
  mv "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$gopackagepath"
}

build() {
  export GOPATH=$srcdir/go
  cd "$GOPATH/src/$gopackagepath"
  make
}

package() {
  export GOPATH=$srcdir/go
  cd "$GOPATH/src/$gopackagepath"
  make install DESTDIR=$pkgdir/usr
}

# vim:set ts=2 sw=2 et:

sha256sums=('dd54393661602bb989ee880f14c41f7a7b47a153777999509127459edae52e47')
