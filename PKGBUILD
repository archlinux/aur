# Maintainer: Luiz Picanço <lpicanco at gmail dot com>
# Contributor: Gabriel Hidasy Rezende <gabrielhidasy at gmail dot com>

pkgname=i3-autodisplay
pkgver=0.6
pkgrel=1
pkgdesc='i3wm display auto-configuration for multiple monitors'
arch=('x86_64')
url="https://github.com/lpicanco/$pkgname"
license=('GPL3')
makedepends=('git' 'go')
depends=('glibc')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('0b78b2b7fbfa68e7e544604ce49014e1196638c6914ef8e9445b56532e649f3c')
conflicts=("$pkgname")

build() {
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  cd "$pkgname-$pkgver"
  go build cmd/i3-autodisplay/i3-autodisplay.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
