# Maintainer Henry Smith <henrysmith6003@protonmail.com>

pkgname=golaunch
pkgver=0.5
pkgrel=1
pkgdesc='a simple .desktop launcher written in go.'
arch=('x86_64')
url="https://github.com/hen6003/golaunch"
license=('MIT')
makedepends=('go' 'git')
optdepends=('fzf: for choosing the app')
source=("https://github.com/hen6003/golaunch/archive/$pkgver.tar.gz")
sha256sums=("7ba6bd3840f4ba8a0efd7a9a29cfa34960705287662c91143009289e4ae28a79")

prepare() {
  go get -u \
    github.com/rkoesters/xdg/basedir \
	github.com/rkoesters/xdg/desktop
}

build() {
  cd "$pkgname"-master
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd "$pkgname"-"$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/"$pkgname"
}
