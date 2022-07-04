# Maintainer: zu1k <i@zu1k.com>
# Contributor: huyz <>

pkgname=nali-go
_pkgname=nali
pkgver=0.4.7
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/zu1k/nali"
license=('MIT')
makedepends=("go>=1.18")
provides=('nali')
conflicts=('nali')
source=("https://github.com/zu1k/nali/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a1116c889f423a29b2c9e3ae84fe7787e80538a2ad1e6f4b6be31db5d4f7a0e7')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -X \"github.com/zu1k/nali/internal/constant.Version=$pkgver\" -extldflags $LDFLAGS" \
    -o $_pkgname .
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
