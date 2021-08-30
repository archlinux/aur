# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=benthos
pkgdesc='Declarative stream processing for mundane tasks and data engineering.'
arch=(aarch64 armv5h armv6h armv7h x86_64)
url='https://benthos.dev'
_url='https://github.com/Jeffail/benthos'
_branch='master'
pkgver=3.53.0
pkgrel=1
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('abcd431f15b36daf900287d9e5c8dc62eaa4526862b07dd4a597b868377efb47')
sha512sums=('ebbaa4d69330b7f9ab9fba65583d9be4093b7cf6bd0d1bdff91f0e24dd550c5a588f9ee42c582d1a7bc8123b5b78ea57f3338d803636bf7717be564f6831329b')
b2sums=('bcf348b474f153e76ff8bd4b3811828438fe95c1dc77622e838cf66a5133a2537a1a409a93d0d0658d9e1997f3e89b0423ffc167a8b0929297d7933a1f47fb20')
provides=($pkgname)
conflicts=($pkgname)

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o benthos cmd/benthos/main.go
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
