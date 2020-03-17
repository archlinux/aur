# Maintainer: kvaps <kvapss@gmail.com>

pkgname=qbec
pkgver=0.10.5
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
sha256sums=('453895e29114b7337a79209abbb15d18a07e05347bd07372aac1a1e5fa96061b')

build() {
  cd "$srcdir/qbec-$pkgver"
  make get os_archive
}

package() {
  install -m 0755 -d "$pkgdir/usr/bin"
  tar x -f "$srcdir/qbec-$pkgver/dist/assets/qbec-linux-amd64.tar.gz" -C "$pkgdir/usr/bin"
  "$pkgdir/usr/bin/qbec" completion | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/qbec"
}
