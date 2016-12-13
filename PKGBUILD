# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=speedtest-zpeters
_pkgver=1.0.3-a
pkgver="${_pkgver//-}"
pkgrel=2
pkgdesc='Command line client for speedtest.net written in Go'
url=https://github.com/zpeters/speedtest
arch=('any')
license=('GPL3')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('9b5222e2b2287afd808d90306761021551a1aa073506efca7dd14e33433c098b32a3933328d293f0ead500fbe546f94ee2a18c1eef48a126373d49063af4c73d')

prepare() {
  mkdir -p src/github.com/zpeters
  ln -fnrs speedtest-$_pkgver src/${url#*//}
}

build() {
  cd speedtest-$_pkgver
  export GOPATH="$srcdir"
  go get -u -v github.com/dchest/uniuri
  go get -u -v github.com/google/go-github/github
  go get -u -v github.com/spf13/viper
  go get -u -v github.com/urfave/cli
  go build -v
}

check() {
  cd speedtest-$_pkgver
  export GOPATH="$srcdir"
  go get -u -v github.com/stretchr/testify/assert
  go test
}

package() {
  cd speedtest-$_pkgver
  install -Dm755 speedtest-$_pkgver "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
