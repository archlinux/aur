# Maintainer: Jenn Wheeler <jwheelerac@gmail.com>
pkgname=kind-git
_pkgname=kind
pkgver=0.11.1.r244.g92e01d72
pkgrel=1
pkgdesc="Kubernetes IN Docker - local clusters for testing Kubernetes"
url="https://github.com/kubernetes-sigs/kind"
source=("git+https://github.com/kubernetes-sigs/kind")
arch=('x86_64')
license=('Apache')
makedepends=('git' 'go')
conflicts=('kind-bin')
provides=('kind')
sha256sums=(SKIP)

build () {
  cd "$srcdir/$_pkgname"
  go build
}

package() {
  install -Dm 755 "$srcdir/$_pkgname/kind" "$pkgdir/usr/bin/kind"

  "$pkgdir/usr/bin/kind" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kind"
  "$pkgdir/usr/bin/kind" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kind"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
