# Maintainer: Axel Gembe <derago@gmail.com>
pkgname=plexdrive
pkgver=5.2.1
pkgrel=1
pkgdesc='Plexdrive mounts your Google Drive FUSE filesystem (optimized for media playback)'
arch=('x86_64' 'aarch64')
url='https://github.com/plexdrive/plexdrive'
license=('MIT')
depends=('fuse')
makedepends=('go')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/plexdrive/plexdrive/archive/$pkgver.tar.gz")
sha256sums=('37d64c4c201419054d33b0313c70e79c53bb55e3c6d35eabdebc43b634c41100')

build() {
  cd "$pkgname-$pkgver/"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  pwd
  go build
}

package() {
  cd "$pkgname-$pkgver/"
  install -Dm755 plexdrive "$pkgdir"/usr/bin/plexdrive
}
