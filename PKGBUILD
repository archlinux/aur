# Maintainer: Mike Hicklen <mike@xfs.repair>

pkgname=aws-iam-authenticator
pkgver=0.5.5
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache')
makedepends=('go')
conflicts=('aws-iam-authenticator-bin' 'aws-iam-authenticator-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/v$pkgver.tar.gz")
sha512sums=('24c2a7fd141f921e18c17f4c7e90bbf5325cc6fad3b35753c0da2d879cf64d8f6af0130f8c45ec7693d6fce043181abbd04a911e6fa778f686bd5c313631ed0f')

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
