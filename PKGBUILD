# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=scaleway-cli
pkgver=1.6.0
pkgrel=2
pkgdesc="Manage BareMetal Servers from Command Line"
arch=('i686' 'x86_64')
url="https://scaleway.com"
license=('MIT')
makedepends=('go' 'git')
source=("https://github.com/scaleway/$pkgname/archive/v${pkgver}.tar.gz")
sha1sums=('1ad53502358dd28b90fca4e407d07786e79f5e7d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # setup local gopath
  mkdir -p $srcdir/src/github.com/scaleway/
  ln -s $srcdir/$pkgname-$pkgver $srcdir/src/github.com/scaleway/$pkgname

  GOPATH="$srcdir" go get -v -d
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  GOPATH="$srcdir" make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 scw $pkgdir/usr/bin/scw
}

# vim:set ts=2 sw=2 et:
