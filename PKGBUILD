# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hoverfly-git
pkgver=1.3.0
pkgrel=1
pkgdesc="Lightweight service virtualization/API simulation tool for developers and testers"
arch=('x86_64')
url='https://hoverfly.io'
license=('Apache')
provides=('hoverfly')
conflicts=('hoverfly-bin' 'hoverfly')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname%-git}::git+https://github.com/SpectoLabs/hoverfly")
sha256sums=('SKIP')

prepare() {
  cd hoverfly
  mkdir -p build/
}

build() {
  cd hoverfly
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd hoverfly
  install -Dm755 build/hoverctl -t "${pkgdir}/usr/bin"
  install -Dm755 build/hoverfly -t "${pkgdir}/usr/bin"
}