# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: JayceCao <jaycecao520@gmail.com>
pkgname=oras
pkgver=1.3.4
pkgrel=1
pkgdesc='A command line tool that allows you to push and pull files from any OCI registry'
arch=(x86_64 aarch64)
url='https://github.com/oras-project/oras'
license=(Apache-2.0)
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/oras-project/oras#commit=v$pkgver")
sha512sums=('b6460f8cfb7fec4073e8c8035633ccc65c7c59fc8518a463de4a36cd6f91ace135495727ad5766de2bee2e3b9214cf9bf70b6206d029c3a1a078507cccd6a4ad')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export VERSION=$pkgver

  cd "$pkgname"
  make build-linux-amd64
}

package() {
  install -Dm 755 "$srcdir/$pkgname/bin/linux/amd64/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
