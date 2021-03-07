# Maintainer: naruto522ru <itachi522ru@gmail.com>
_name=shadowsocks2
pkgname=go-shadowsocks2
pkgver=0.1.4
pkgrel=1
pkgdesc="Modern Shadowsocks in Go (stable version)"
arch=('i686' 'x86_64')
url="https://github.com/shadowsocks/$pkgname"
license=('Apache')
#depends=()
makedepends=(
  'go'
)
conflicts=(shadowsocks-go-git)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('b4e9396b121eec140aede426450fb579e67e6ba8b905f91ed022e41233a11456')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ./build/"${_name}"
}

package() {
  mkdir -p "${pkgdir}"/usr/bin
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/${_name}" "${pkgdir}"/usr/bin
}
