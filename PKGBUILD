# Maintainer: Prasanth Bupd <bupdprasanth@gmail.com>
pkgname=oras-git
pkgver=1.3.0
pkgrel=1
pkgdesc='OCI registry client - managing content like artifacts, images, packages'
arch=(x86_64)
url='https://github.com/oras-project/oras'
license=(MIT)
makedepends=('go' 'git')
conflicts=('oras')
source=("$pkgname::git+https://github.com/oras-project/oras#commit=v$pkgver")
sha512sums=('SKIP')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export VERSION=$pkgver

  cd "$pkgname"
  make build-linux-amd64
}

package() {
  install -Dm755 "$srcdir/$pkgname/bin/linux/amd64/oras" "$pkgdir/usr/bin/oras"
}
