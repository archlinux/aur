pkgname=nsd-exporter-git
_pkgname=nsd_exporter
pkgver=v0.3.1.r0.g1d75ba5
pkgdesc="Prometheus exporter for NSD (Name Server Daemon) "
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/optix2000/nsd_exporter'
source=('git+https://github.com/optix2000/nsd_exporter')
depends=()
makedepends=('go')
sha1sums=('SKIP')
license=('BSD 3-Clause License')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "$srcdir/$_pkgname"
  GO111MODULE=on go build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 'nsd_exporter' "$pkgdir/usr/bin/nsd_exporter"
  install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
