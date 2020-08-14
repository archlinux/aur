# Maintainer Henry Smith <henrysmith6003@protonmail.com>

pkgname=golaunch
pkgver=0.3
pkgrel=1
pkgdesc='a simple .desktop launcher written in go.'
arch=('x86_64')
url="https://github.com/hen6003/golaunch"
license=('MIT')
makedepends=('go' 'git')
source=("https://github.com/hen6003/golaunch/archive/master.tar.gz")
md5sums=("a2e271a579b432a185b598fbf30e51d0")

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
  cd "$pkgname"-master
  mkdir -p "$pkgdir"/usr/bin/
  install -Dm755 $pkgname "$pkgdir"/usr/bin/"$pkgname"
}
