# Maintainer: Chris Werner Rau <aur@cwrau.io>
# Submitter: Chris Werner Rau <aur@cwrau.io>

_pkgname=kyverno
pkgname=$_pkgname-git
pkgver=r4554.fffd6aa9a
pkgrel=0
pkgdesc="Kubernetes Native Policy Management - CLI"
arch=('any')
url="https://github.com/kyverno/$_pkgname"
source=("git+$url")
md5sums=('SKIP')
license=('Apache')
makedepends=('make' 'go')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  make build-cli
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 "$srcdir/$_pkgname/cmd/cli/kubectl-kyverno/kubectl-kyverno" "$pkgdir/usr/bin/$_pkgname"
}
