# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=webdavfs
pkgver=1.0
pkgrel=1
pkgdesc='A FUSE filesystem for WEBDAV shares'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/miquels/webdavfs"
license=('MIT')
depends=('fuse2')
makedepends=('go')
source=("https://github.com/miquels/webdavfs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3db114d53be3dc48eae6036988a2d9d5b8104bb9e5a886d5e7d46c345a1aee0')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "$pkgname-$pkgver"
  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 webdavfs "$pkgdir"/usr/bin/webdavfs
  ln -s webdavfs "$pkgdir"/usr/bin/mount.webdavfs
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
