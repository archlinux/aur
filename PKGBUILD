# Maintainer: Chris Werner Rau <aur@cwrau.io>
# Submitter: Chris Werner Rau <aur@cwrau.io>

_pkgname=kyverno
pkgname=kyverno-git
pkgver=v1.1.4.rc1.r45.g2768574a
pkgrel=3
pkgdesc="Kubernetes Native Policy Management - CLI"
arch=('any')
url="https://github.com/nirmata/kyverno"
source=("git+https://github.com/nirmata/kyverno")
md5sums=('SKIP')
license=('Apache')
depends=()
makedepends=('make' 'go')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/$_pkgname
    make cli
    install -Dm755 "$srcdir/$_pkgname/cmd/cli/kubectl-kyverno/kyverno" "$pkgdir/usr/bin/$_pkgname"
}
