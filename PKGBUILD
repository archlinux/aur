# Maintainer: xstaticxgpx (optimum.reflex<at>gmail<dot>com)

pkgname=conmon
pkgver=1.11.2
pkgrel=1
pkgdesc="Library for running OCI-based containers."
arch=('x86_64')
url="https://github.com/containers/libpod"
license=('Apache-2.0')
depends=(
  'go'
)
makedepends=(
  'go'
)
source=("https://github.com/kubernetes-incubator/cri-o/archive/v1.11.2.tar.gz")
sha256sums=('cd63d23f16ad4daa535c39e34322a62d2065017bd5d7cc09fa98515322d04cce')

prepare() {
  export GOPATH="$srcdir/go"

  # prepare go src directories
  mkdir -p "$srcdir/go/src/github.com/kubernetes-incubator"
  mv "cri-o-1.11.2/" "$srcdir/go/src/github.com/kubernetes-incubator/cri-o"

}
build() {
  cd "$GOPATH/src/github.com/kubernetes-incubator/cri-o"

  mkdir bin
  make bin/conmon
}
package() {
  install -Dm755 "$GOPATH/src/github.com/kubernetes-incubator/cri-o/bin/conmon" "$pkgdir/usr/bin/conmon"
}
