# Maintainer: zimbatm <zimbatm@zimbatm.com>
pkgname=direnv
pkgver=2.19.2
pkgrel=1
pkgdesc='a shell extension that manages your environment'
arch=('x86_64' 'i686')
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

sha256sums=('407e46233942277dcac133bcf9dc656c825299c611d0b22b9cd02841c4c34ffb')
