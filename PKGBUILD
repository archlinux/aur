# Mathias Merscher <archlinux@rheinekopfsache.de>

pkgname=kubicorn-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Create, Manage, and Scale Kubernetes infrastructure in the cloud."
arch=('i686' 'x86_64')
url="https://github.com/kubicorn/kubicorn"
makedepends=('git' 'go')
optdepends=(
  'kubectl: check cluster status'
  'kubectl-bin: check cluster status - binary package'
)
license=('Apache')
source=("git+https://github.com/kubicorn/kubicorn")
md5sums=('SKIP')

prepare() {
  mkdir -p "$srcdir/src/github.com/kubicorn"
  mv -T "$srcdir/kubicorn" "$srcdir/src/github.com/kubicorn/kubicorn"
}

build() {
  export GOPATH="$srcdir"
  cd "$GOPATH/src/github.com/kubicorn/kubicorn"
  make
}

package() {
  install -Dm755 "$srcdir/src/github.com/kubicorn/kubicorn/bin/kubicorn" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/kubicorn" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kubicorn"
  "$pkgdir/usr/bin/kubicorn" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kubicorn"
}
