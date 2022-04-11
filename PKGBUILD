# Maintainer: Mike Hicklen <mike@xfs.repair>

pkgname=aws-iam-authenticator
pkgver=0.5.7
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache')
makedepends=('go')
conflicts=('aws-iam-authenticator-bin' 'aws-iam-authenticator-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/v$pkgver.tar.gz")
sha512sums=('9148cd765e741253e99d25db3a17dbcd074ff2a2946e4591f1476b98f01eef49fd8c2f265d2ad47b70ccd20ad0e2ae44aa81984483cbeb5ced25e0c8f9a1c1f5')

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
