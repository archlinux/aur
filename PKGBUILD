# Maintainer: Tomasz Rakowski <akayami@gmail.com>
pkgname=sms2mail
pkgver=0.0.17
pkgrel=1
pkgdesc="SMS to Mail forwarder"
arch=('x86_64' 'aarch64')
url="https://github.com/akayami/sms2mail"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8059d1f26242c5199da42ba40d44061dcacf6048cb9240fbca3d34c8ceecd1bd')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

