# Maintainer: stocki <mail at firstname lastname dot de>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: zfo <zfoofz1@gmail.com>
pkgname=gcsfuse
pkgver=0.28.1
pkgrel=1
pkgdesc="A user-space file system for interacting with Google Cloud Storage"
url="https://github.com/GoogleCloudPlatform/gcsfuse"
arch=('x86_64')
license=('APACHE')
depends=('glibc')
makedepends=('git' 'go-pie')
optdepends=('google-cloud-sdk: authentication helper')
source=("$pkgname-$pkgver::https://github.com/GoogleCloudPlatform/gcsfuse/archive/v$pkgver.tar.gz")
sha256sums=('26a468622e5a0450a6bfbb4853f1c0df3b031e5f8fe5b0c147c1200a1a8ee137')
_gourl=github.com/googlecloudplatform/gcsfuse

prepare() {
  export GOPATH="$srcdir/go"  
  mkdir -p "$GOPATH/src/$(dirname $_gourl)"
  ln -sf "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$_gourl"
}

build() {
  export GOPATH="$srcdir/go"  
  go build "$_gourl"
}

package() {
  install -Dm755 gcsfuse "${pkgdir}/usr/bin/gcsfuse"
}
