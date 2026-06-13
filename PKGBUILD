# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: JayceCao <jaycecao520@gmail.com>
pkgname=oras
pkgver=1.3.2
pkgrel=1
pkgdesc='A command line tool that allows you to push and pull files from any OCI registry'
arch=(x86_64 aarch64)
url='https://github.com/oras-project/oras'
license=(Apache-2.0)
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/oras-project/oras#commit=v$pkgver")
sha512sums=('64b1f2ef183cdee3e8b1debc174d1d9060f7e2109d0f62a977b5b35335e7a365d99e283adac104957af0bbc4ffb168ba1e8ef312568bd72bce652e9a5b6c2573')

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
