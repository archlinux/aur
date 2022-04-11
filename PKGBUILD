# Maintainer: Mike Hicklen <mike@xfs.repair>

pkgname=aws-iam-authenticator
pkgver=0.5.7
pkgrel=2
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache')
makedepends=('go')
conflicts=('aws-iam-authenticator-bin' 'aws-iam-authenticator-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/v$pkgver.tar.gz")
sha512sums=('64d0959555a39f0fd1f55e689495507a3d1fd005ced4287ea853750915c1953a328f794a37799b4f0936fca2a009fa7d7fdb432be79468b643f5f967edaf8f9c')

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
