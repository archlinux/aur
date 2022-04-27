# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=go-bindata
pkgver=4.0.0
pkgrel=2
pkgdesc="A small utility which generates Go code from any file"
arch=('x86_64')
url='https://github.com/shuLhan/go-bindata'
license=('custom:CC0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shuLhan/go-bindata/archive/v${pkgver}.tar.gz")
sha512sums=('c6182dd5ac46e7febe272e8f59c5e5c76658d42584c5db10e7b188577fc56d7a26f1743fea328f149ae5628fa305ca98cb5f27a29cef270cd10ef806e0e149bc')

build() {
  export GO111MODULE=off
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export GOPATH="$srcdir"
  mkdir -p "$GOPATH"/src/github.com/shuLhan/
  mv $pkgname-$pkgver $GOPATH/src/github.com/shuLhan/go-bindata
  cd $GOPATH/src/github.com/shuLhan/go-bindata

  go build ./cmd/...
}

package() {
  cd src/github.com/shuLhan/go-bindata

  install -Dm755 "go-bindata" "${pkgdir}/usr/bin/go-bindata"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
