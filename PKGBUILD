# Maintainer: afontenot <adam.m.fontenot@gmail.com>

pkgname=batcli-git
pkgver=0.0.1.r9.gcba1c6b
pkgrel=1
pkgdesc="Bat is a CLI cURL-like tool for humans inspired by Httpie and written in Go."
arch=('x86_64' 'i686')
url="https://github.com/astaxie/bat"
license=('APACHE')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("bat::git+https://github.com/astaxie/bat.git")
sha256sums=('SKIP')

pkgver() {
  cd "bat"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "bat"
  sed -i 's/github.com\/astaxie\/bat\//.\//' http.go
  sed -i 's/github.com\/astaxie\/bat\//.\//' bench.go
  go build
}

package() {
  cd "bat"
  install -Dm755 "bat" "$pkgdir/usr/bin/bat"
}
