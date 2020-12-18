# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=drive
pkgver=0.4.0
pkgrel=1
pkgdesc='CLI Google Drive client'
arch=(x86_64)
url=http://github.com/odeke-em/$pkgname
license=(Apache)
depends=(glibc)
makedepends=(go git)
source=($pkgname-$pkgver.tar.gz::https://github.com/odeke-em/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('59e53528222a26e88d8c4bb9ed9f841cc0bf07d6955099c5338a8ce18bc0ff673190d1c16b13ea3903cea4400828c84627ed479b98f2f9f42e39e212e8d0f8d4')

build() {
  cd $pkgname-$pkgver
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  GOPATH="$srcdir"/$pkgname-$pkgver go get -v -x \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    github.com/odeke-em/$pkgname/cmd/$pkgname
}

package() {
  cd $pkgname-$pkgver
  install -D bin/$pkgname -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
