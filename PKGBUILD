# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=pulumi
pkgver=1.8.1
pkgrel=1
pkgdesc='Pulumi - Modern Infrastructure as Code'
arch=('x86_64')
url="https://github.com/$pkgname"
license=('GPL')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('63fc2f1e88118ca3654f426c2391f7cbe1100f17f12d047b290c2bee5b450879')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-X github.com/pulumi/pulumi/pkg/version.Version=$pkgver -extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
