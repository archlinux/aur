# Maintainer: mingming

pkgname=ucloud
pkgver=0.3.3
pkgrel=1
pkgdesc='Command line interface for UCloud services'
arch=('x86_64' 'aarch64')
url='https://github.com/ucloud/ucloud-cli'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=('ucloud-cli')
conflicts=('ucloud-bin' 'ucloud-git')
options=('!debug')
source=("git+https://github.com/ucloud/ucloud-cli.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-cli"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"

  go build -ldflags "-X main.Version=${pkgver}" -o ucloud main.go
}

package() {
  cd "${pkgname}-cli"

  install -Dm755 ucloud "${pkgdir}/usr/bin/ucloud"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
