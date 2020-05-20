# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=asm-cli
pkgver=1.0.1
pkgrel=3
pkgdesc="Interactive shell of assembly language(X86/X64) based on unicorn and keystone"
arch=('x86_64')
url='https://github.com/cch123/asm-cli'
license=('MIT')
depends=('unicorn' 'keystone')
makedepends=('go' 'unicorn' 'keystone')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('42ee5143561491888720cae1c5443a4bfc36bee45cf4898eceb9b7eb3e0bdab6')

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
  install -Dm755 build/${pkgname}-${pkgver} "${pkgdir}/usr/bin/asm-cli"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/asm-cli/LICENSE"
}