# Maintainer: Tomasz Rakowski <akayami@gmail.com>
pkgname=sms2mail
pkgver=0.0.18
pkgrel=1
pkgdesc="SMS to Mail forwarder"
arch=('x86_64' 'aarch64')
url="https://github.com/akayami/sms2mail"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7a7202c11a84a69831af5317f3ff72d8bc6d54ffdccb634aa095a4576bbaa795')

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

