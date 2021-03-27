# Maintainer: Luiz Picanço <lpicanco at gmail dot com>
# Contributor: Gabriel Hidasy Rezende <gabrielhidasy at gmail dot com>

pkgname=i3-autodisplay
pkgver=0.5
pkgrel=1
pkgdesc='i3wm display auto-configuration for multiple monitors'
arch=('x86_64')
url="https://github.com/lpicanco/$pkgname"
license=('GPL3')
makedepends=('git' 'go')
depends=('glibc')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('797125c2963364641089c8faed3bb4c7a1aa316f1e80fff438748a86ea0558d5')
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
