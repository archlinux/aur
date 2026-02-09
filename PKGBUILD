# Maintainer: gomanager <gomanager@generated>
pkgname=hashi-up
pkgver=0.16.0
pkgrel=2
pkgdesc="bootstrap HashiCorp Consul, Nomad, or Vault over SSH < 1 minute"
arch=('x86_64' 'aarch64')
url="https://github.com/jsiebens/hashi-up"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/jsiebens/hashi-up.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
