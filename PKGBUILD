# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=benthos
pkgdesc='Declarative stream processing for mundane tasks and data engineering.'
arch=(aarch64 armv5h armv6h armv7h x86_64)
url='https://benthos.dev'
_url='https://github.com/Jeffail/benthos'
_branch='master'
pkgver=3.46.0
pkgrel=1
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('5444fe6f879a8780c983fabef65fbc7432198c4fe45bbc2ae448475045d56b96')
sha512sums=('a4350d85db4d5724129713271a15357f31c3ff8853eab94591bf89024148f61ec32cb52138d19686aa7e8b1ccc994d9da8b6adf4f29ba0520ab2cd0e828ef896')
b2sums=('58f01e9e4674f17b0a1d1ff314a0c74a3be81933c18599253322b820e52b482cf07ca353624b8f64e7a2294f40bbaecec3a71329ed6c600ac38539c1620727df')
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
