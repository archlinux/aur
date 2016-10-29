# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=teleconsole
pkgver=0.3.1
pkgrel=2
pkgdesc="Command line tool to share your UNIX terminal and forward local TCP ports to people you trust."
arch=('i686' 'x86_64')
url="https://github.com/gravitational/teleconsole/"
license=('Apache')
makedepends=('go')
source=(https://github.com/gravitational/teleconsole/archive/$pkgver.tar.gz)
sha1sums=('a30e24a6e41af2296ba85b9f5c336824b19adf6d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  GOPATH=`pwd` go get -d -v
  sed -i 's|ProxyHost:|ProxyHostPort:|' src/github.com/gravitational/teleconsole/clt/clt.go
  GOPATH=`pwd` go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
