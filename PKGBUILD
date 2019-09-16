# Maintainer: Lorenzo Fontana <lo@linux.com>
pkgname=kubectl-trace-git
_pkgname=kubectl-trace
pkgver=201.a38c074
pkgrel=1
pkgdesc="Schedule bpftrace programs on your kubernetes cluster using the kubectl "
makedepends=("go" "make")
arch=("any")
url="https://github.com/iovisor/kubectl-trace"
license=("MIT")
provides=("kubectl-trace")

source=("git+https://github.com/iovisor/kubectl-trace.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make clean
  make _output/bin/$_pkgname
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  cd "_output/bin"
  install -D -m755 "kubectl-trace" "$pkgdir/usr/bin/kubectl-trace"
}

