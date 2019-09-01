# Maintainer: keylo99 <keylo99official@gmail.com>

pkgname=pkgtop-git
pkgdesc="Interactive package manager & resource monitor"
pkgver=1.5.r0.g6dad207
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

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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