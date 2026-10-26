# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: JayceCao <jaycecao520@gmail.com>
pkgname=oras
pkgver=1.3.6
pkgrel=1
pkgdesc='A command line tool that allows you to push and pull files from any OCI registry'
arch=(x86_64 aarch64)
url='https://github.com/oras-project/oras'
license=(Apache-2.0)
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/oras-project/oras#commit=v$pkgver")
sha512sums=('38b125a15000a9ada24674088a2022db1ba35784e57694970644b0a4282707472fe0107c7c21a3a860899a75c52f06793fd4cbd9398c7603892b2e8129d728b1')

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
