# Maintainer: dvb < echo =oQZk5ibltmcwIGQ4VnbpxGajJXY | rev | base64 -d >
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname=trufflehog
pkgver=3.99.3
pkgrel=1
pkgdesc="Tool for finding secrets like private keys and credentials."
arch=('x86_64')
url="https://github.com/trufflesecurity/trufflehog"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
provides=('trufflehog')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ed57616a52d1899e29417b854343cd5cbdf967eda261692c9d68b234346d4a2d593dc2348a1912e7f38a43c60b575edd9f1d14147ac2d997902a490cacc482da')

build() {
  cd "$pkgname-$pkgver"
  GOPATH="$srcdir/build" go build -buildmode=pie -ldflags "-linkmode=external -extldflags \"$LDFLAGS\"" -modcacherw -trimpath
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
