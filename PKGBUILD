# Maintainer: Luiz Picanço <lpicanco at gmail dot com>
# Contributor: Gabriel Hidasy Rezende <gabrielhidasy at gmail dot com>

pkgname=i3-autodisplay
pkgver=0.4
pkgrel=1
pkgdesc='i3wm display auto-configuration for multiple monitors'
arch=('x86_64')
url="https://github.com/lpicanco/$pkgname"
license=('GPL3')
makedepends=('git' 'go')
depends=('glibc')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('a54b24dafc6665ee6f3c89559cd15bb1e1ed2adde7a638c7f84f6556b1504d84')
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