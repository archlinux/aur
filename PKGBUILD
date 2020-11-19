# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=panicparse
pkgver=1.5.1
pkgrel=1
pkgdesc="Crash your app in style (Golang)"
arch=('x86_64')
url='https://github.com/maruel/panicparse'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4ff41f29e1c752027f72155a5a93aca20c3270c43d0db3220c6165a4436e9aa5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/panicparse "${pkgdir}/usr/bin/panicparse"
}
