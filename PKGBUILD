# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>

pkgname=gx-go
pkgver=1.9.0
pkgrel=2

pkgdesc="A tool to use with the gx package manager for packages written in go"
url="https://github.com/whyrusleeping/gx-go"
arch=('x86_64')
license=('MIT')

makedepends=('git' 'go-pie')
depends=('glibc')

source=("git+https://github.com/whyrusleeping/gx-go.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  mkdir -p "$srcdir"/src/github.com/whyrusleeping/
  ln -fs "$srcdir/gx-go" "$srcdir"/src/github.com/whyrusleeping/gx-go
}

build() {
  # Required for go get
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  cd "$srcdir"/src/github.com/whyrusleeping/gx-go

  go get -v
  go install -v
}

package() {
  install -Dm 755 bin/gx-go "${pkgdir}/usr/bin/gx-go"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/gx-go" gx-go/LICENSE
}
