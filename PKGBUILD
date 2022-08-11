# Maintainer: kvaps <kvapss@gmail.com>

pkgname=qbec
pkgver=0.15.2
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
sha256sums=('570c1818028ae66a23bb83448cc6e499dd1c01a34632e8dba0d604fc7c185be7')

build() {
  cd "$srcdir/qbec-$pkgver"
  make get os_archive
}

package() {
  install -m 0755 -d "$pkgdir/usr/bin"
  tar x -f "$srcdir/qbec-$pkgver/dist/assets/qbec-linux-amd64.tar.gz" -C "$pkgdir/usr/bin"
  "$pkgdir/usr/bin/qbec" completion | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/qbec"
}
