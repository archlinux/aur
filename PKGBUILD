# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=drive
pkgver=0.3.9.1
pkgrel=1
pkgdesc='CLI Google Drive client'
arch=(x86_64)
url=http://github.com/odeke-em/$pkgname
license=(Apache)
depends=(glibc)
makedepends=(go git)
source=($pkgname-$pkgver.tar.gz::https://github.com/odeke-em/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('5d8f6aaf08ad600915bac4c30626998069d1c6fa676948eb1e03235562dfdf447c0f9f05dbf2c5ffbf6e3e05003b3cee180b9fd28ceb7e83746a52d6640dcfa1')

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
