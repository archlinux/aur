# Maintainer: kvaps <kvapss@gmail.com>

pkgname=qbec
pkgver=0.11.0
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
sha256sums=('fddf7fae84ba0bbdef343a86486a9bea406d644c5dc22e9724b0dd564534625d')

build() {
  cd "$srcdir/qbec-$pkgver"
  make get os_archive
}

package() {
  install -m 0755 -d "$pkgdir/usr/bin"
  tar x -f "$srcdir/qbec-$pkgver/dist/assets/qbec-linux-amd64.tar.gz" -C "$pkgdir/usr/bin"
  "$pkgdir/usr/bin/qbec" completion | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/qbec"
}
