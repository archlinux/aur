# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-git
_pkgname=nali
pkgver=0.7.2.r0.gde355d1
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider. (development version)'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/zu1k/nali"
license=('MIT')
makedepends=("go>=1.18")
provides=('nali')
conflicts=('nali')
source=("git+https://github.com/zu1k/nali.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -X \"github.com/zu1k/nali/internal/constant.Version=$pkgver\" -extldflags $LDFLAGS" \
    -o $_pkgname .
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
