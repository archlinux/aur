# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>

pkgname=telepresence2-git
pkgver=2.4.0.r1.gd31d1761
pkgrel=1
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
arch=('x86_64')
license=('Apache')
url="https://github.com/telepresenceio/telepresence"
makedepends=('go' 'git' 'make')
backup=()
depends=()
provides=(telepresence2)
conflicts=(telepresence-git telepresence telepresence2)
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --long --tags | sed 's/^rpc\/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package(){
  cd ${srcdir}/${pkgname}
  TELEPRESENCE_VERSION=`git describe --long --tags | sed 's/^rpc\///;s/\([^-]*-g\)/r\1/g' | awk -F '-' '{print $1}'` make build
  install -Dm755 ./build-output/bin/telepresence ${pkgdir}/usr/bin/telepresence
}
