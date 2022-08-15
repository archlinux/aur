# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=kops-git
pkgver=1.25.0.alpha.2.r85.g429ebecdca
pkgrel=2
pkgdesc="Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management. (git version)"
arch=('x86_64')
url="https://github.com/kubernetes/kops"
license=('Apache')
makedepends=('go' 'git')
provides=('kops')
conflicts=('kops' 'kops-bin')
source=("${pkgname}::git+https://github.com/kubernetes/kops")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  export GOPATH=$srcdir
  mkdir -p "$GOPATH/src/k8s.io"
  mv $pkgname $GOPATH/src/k8s.io/kops
}

build() {
  export GOPATH=$srcdir
  export GOBIN=$srcdir/bin
  cd $GOPATH/src/k8s.io/kops
  make
}

package() {
  install -Dm755 "$GOPATH/bin/kops" "$pkgdir/usr/bin/kops"
}
