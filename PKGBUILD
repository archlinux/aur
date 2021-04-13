# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=benthos
pkgdesc='Declarative stream processing for mundane tasks and data engineering.'
arch=(aarch64 armv5h armv6h armv7h x86_64)
url='https://benthos.dev'
_url='https://github.com/Jeffail/benthos'
_branch='master'
pkgver=3.44.0
pkgrel=1
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('c7cc44f2361fda9691c2efe74dbea54f577ce49798e4180ba9585173672e6634')
sha512sums=('659014ff78f92b8858f0c25cb8809ede5b337a157300f4da1153f541f5e697abe1c98827ce1eddaf5565cff4e69173b5394972545bd65e4decbcbf5f55af07ff')
b2sums=('3c1e1cb245f792e429465b530b1604d52cf2a2c2896fef337206db049b70fdda75bde23ec83faf7ec55757b38dfedec5615a499561138678f12cead35053a92c')
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
