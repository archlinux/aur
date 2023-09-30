# Maintainer: Mike Hicklen <mike@xfs.repair>

pkgname=aws-iam-authenticator
pkgver=0.6.9
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache')
makedepends=('go')
conflicts=('aws-iam-authenticator-bin' 'aws-iam-authenticator-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/v$pkgver.tar.gz")
sha512sums=('8fb7b4803f20f1311b19c88cef1497017ff05ac5009309acc307c8befd219fc80815d281c2e3d139d0fe507e4ac4ed966be607347bd0298e6826b9be76b73873')

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
