# Maintainer: M0Rf30

_pkgname=fabric
pkgname=hyperledger-${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="A platform for distributed ledger solutions, underpinned by a modular architecture delivering high degrees of confidentiality, resiliency, flexibility and scalability"
arch=(x86_64)
url="https://github.com/hyperledger/fabric"
license=('APACHE')
groups=('hyperledger-fabric')
depends=('go')
source=("https://github.com/hyperledger/fabric/archive/v$pkgver.tar.gz")

prepare() {
  export GOPATH="$PWD"/.gopath
  mkdir -p "$GOPATH"/src/github.com/hyperledger
  ln -sf "$PWD"/fabric-$pkgver "$GOPATH"/src/github.com/hyperledger/fabric
}

build() {
  export GOPATH="$PWD"/.gopath
  cd "$GOPATH"/src/github.com/hyperledger/fabric
  make release/linux-amd64
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -r release/linux-amd64/bin "$pkgdir/usr"
}

md5sums=('a3b3b80224c88fe984207e6321ccdb04')
