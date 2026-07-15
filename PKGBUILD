# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: JayceCao <jaycecao520@gmail.com>
pkgname=oras
pkgver=1.3.3
pkgrel=1
pkgdesc='A command line tool that allows you to push and pull files from any OCI registry'
arch=(x86_64 aarch64)
url='https://github.com/oras-project/oras'
license=(Apache-2.0)
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/oras-project/oras#commit=v$pkgver")
sha512sums=('46ab980e736284fd5da09f013b35656b1ba0f08cbc16363fa95c8b185cdf2f641b71a6b2a12a0ca7e7a1f124a8a9ccf52078c6511e1fa714321d7e629ae67ae9')

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
