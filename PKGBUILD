# Maintainer: David Birks <david@tellus.space>

pkgname=cinf
pkgver=0.4.0
pkgrel=1
pkgdesc='Command line tool to view namespaces and cgroups'
arch=('x86_64')
url="https://github.com/mhausenblas/cinf"
license=('Apache')
makedepends=('go')
source=("$url/archive/v$pkgver-alpha.tar.gz")
sha512sums=('bd73ed979c1456de51f934257b7071e7fa3a8ae6466800c37c3f84b3c95f69fc9b8989e906831c452cca9e78139a98a9e3152656b8e513aec0619408b81ba43c')

prepare(){
  mkdir -p gopath/src/github.com/mhausenblas/
  ln -rTsf $pkgname-$pkgver-alpha gopath/src/github.com/mhausenblas/cinf
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/mhausenblas/cinf
  go get -d ./...
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/mhausenblas/cinf
  go install \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

package() {
  install -Dm755 gopath/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}

