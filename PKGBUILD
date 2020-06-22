# Maintainer: Daniel Lublin <daniel@lublin.se>

_pkgname=hd
pkgname=$_pkgname-git
pkgver=1.0.0.r5.g4bc9165
pkgrel=1
pkgdesc='Small hex dumper utility (with optional HexII output)'
arch=('i686' 'x86_64')
url="https://github.com/kastelo/$_pkgname"
license=('MIT')
makedepends=('git' 'go-pie')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  go build \
    -trimpath \
    -buildmode=pie \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    -o $_pkgname \
    .
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
