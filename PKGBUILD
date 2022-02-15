# Maintainer: Chris Werner Rau <aur@cwrau.io>
# Submitter: Chris Werner Rau <aur@cwrau.io>

_pkgname=kyverno
pkgname=$_pkgname-git
pkgver=1.7.dev.r3.g5c91bb821
pkgrel=1
pkgdesc="Kubernetes Native Policy Management - CLI"
arch=('any')
url="https://github.com/kyverno/$_pkgname"
source=("git+$url")
md5sums=('SKIP')
license=('Apache')
makedepends=('make' 'go')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  make cli
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 "$srcdir/$_pkgname/cmd/cli/kubectl-kyverno/kyverno" "$pkgdir/usr/bin/$_pkgname"
}
