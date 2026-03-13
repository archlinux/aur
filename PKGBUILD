# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: JayceCao <jaycecao520@gmail.com>
pkgname=oras
pkgver=1.3.1
pkgrel=1
pkgdesc='A command line tool that allows you to push and pull files from any OCI registry'
arch=(x86_64)
url='https://github.com/oras-project/oras'
license=(Apache-2.0)
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/oras-project/oras#commit=v$pkgver")
sha512sums=('72a2291db600662744675af3fdf3b3370f5e256392ea950859fc4eea3239aec403b9695c8ff1d68a0c388475a13e201d2f6dc5239747273cccb3fd7e7f5ee692')

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
