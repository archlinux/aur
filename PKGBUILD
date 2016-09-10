# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=teleconsole
pkgver=0.2.0
pkgrel=1
pkgdesc="Command line tool to share your UNIX terminal and forward local TCP ports to people you trust."
arch=('i686' 'x86_64')
url="https://github.com/gravitational/teleconsole/"
license=('Apache')
makedepends=('go')
source=(https://github.com/gravitational/teleconsole/archive/$pkgver-beta.tar.gz)
sha1sums=('742d9253b60819c0396eba6bcb40786b687de777')

build() {
  cd "$srcdir/$pkgname-$pkgver-beta"
  GOPATH=`pwd` go get -d -v
}

package() {
  cd "$srcdir/$pkgname-$pkgver-beta"
  sed -i 's|localClient.SSH(cmd, false)|localClient.SSH(cmd, false, nil)|' src/github.com/gravitational/teleconsole/clt/clt.go
  GOPATH=`pwd` go build

  install -Dm755 "$pkgname-$pkgver-beta" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
