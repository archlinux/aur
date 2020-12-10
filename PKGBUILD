# Maintainer: kvaps <kvapss@gmail.com>

pkgname=qbec
pkgver=0.13.2
pkgrel=0
pkgdesc="Configure Kubernetes objects on multiple clusters using Jsonnet"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/splunk/qbec"
makedepends=('git' 'go')
license=('Apache')
provides=(qbec)
optdepends=(
  'jsonnet-bundler-bin: jsonnet package manager'
)
source=("https://github.com/splunk/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7c7d5eb36fc7036b998a5255ceb002ff79fa7e867753ceabcecaf4f4e9688c2e')

build() {
  cd "$srcdir/qbec-$pkgver"
  make get os_archive
}

package() {
  install -m 0755 -d "$pkgdir/usr/bin"
  tar x -f "$srcdir/qbec-$pkgver/dist/assets/qbec-linux-amd64.tar.gz" -C "$pkgdir/usr/bin"
  "$pkgdir/usr/bin/qbec" completion | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/qbec"
}
