# Maintainer: David Birks <david@birks.dev>

pkgname=aws-iam-authenticator
pkgver=0.5.0
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache')
makedepends=('go')
conflicts=('aws-iam-authenticator-bin' 'aws-iam-authenticator-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/v$pkgver.tar.gz")
sha512sums=('abe725b61e8c645ceabad28804c2687def541e6f6beb305fd49b624ab150b9c4a2dad169958ea13ae7d42cf417a6627a1459702d5451f34139a2b5f70c46d37a')

build() {
  cd $pkgname-$pkgver
  go build \
    --trimpath \
    --ldflags "-X main.version=$pkgver" \
    ./cmd/aws-iam-authenticator
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
