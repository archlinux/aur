# Maintainer: gomanager <gomanager@generated>
pkgname=cfnctl
pkgver=0.1.1
pkgrel=2
pkgdesc="Cfnctl brings the Terraform cli experience to AWS Cloudformation :cloud:   "
arch=('x86_64' 'aarch64')
url="https://github.com/rogerwelin/cfnctl"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/rogerwelin/cfnctl.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/cfnctl
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
