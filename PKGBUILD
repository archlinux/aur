# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=go-bindata
pkgver=3.5.2
pkgrel=2
pkgdesc="A small utility which generates Go code from any file"
arch=('x86_64')
url='https://github.com/shuLhan/go-bindata'
license=('custom:CC0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shuLhan/go-bindata/archive/v${pkgver}.tar.gz")
sha512sums=('2e9a807445ed6ddfd681f6886503c116c8ceba6572f5a8b2cdbf78c585a476b5dfb0dc967b62f1510caef8e1e09db39043362e252da773272a79a7b257c9d275')

build() {
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd $pkgname-$pkgver

  go build ./cmd/...
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 "go-bindata" "${pkgdir}/usr/bin/go-bindata"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
