# Maintainer: Rhys Perry <rhysperry111 AT gmail DOT com>

pkgname=cloudmonkey
pkgver=6.5.0
pkgrel=1
pkgdesc="CloudMonkey is a command line interface (CLI) for Apache CloudStack."
arch=('any')
url="https://github.com/apache/cloudstack-cloudmonkey"
license=('Apache-2.0')
makedepends=('go' 'make' 'git')
source=("https://github.com/apache/cloudstack-cloudmonkey/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('8f88ebbab6482258591b3ad82ac05948181c2354f748dbce107f6469e39483a4966a025c059700a56dc899bcbba4c4e3aceb5e828d642230e63e2d895b15727e')

build() {
  cd "cloudstack-cloudmonkey-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  make all
}

package() {
  cd "cloudstack-cloudmonkey-${pkgver}"
  install -Dm755 bin/cmk "$pkgdir"/usr/bin/cmk
}
