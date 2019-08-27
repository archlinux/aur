# Maintainer: keylo99 <keylo99official@gmail.com>

pkgname=pkgtop-git
pkgdesc="Interactive package manager & resource monitor"
pkgver=1.0.0
pkgrel=1
arch=('any')
url="https://github.com/keylo99/pkgtop"
license=('GPL3')
depends=('git')
makedepends=('go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://github.com/keylo99/pkgtop.git#branch=master')
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname%-git}/src"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "${pkgname%-git}" .
}

package() {
  cd "$srcdir/${pkgname%-git}/src"
  install -Dm755 "${pkgname%-git}" "$pkgdir/usr/local/bin/${pkgname%-git}"
}