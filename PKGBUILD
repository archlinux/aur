# Maintainer Danny Grove <aur@dannygrove.com>

pkgname=kubectl-ai
pkgver=0.0.31
pkgrel=2
pkgdesc="AI powered Kubernetes Assistant"
url="https://github.com/GoogleCloudPlatform/$pkgname"
license=('Apache-2.0')
source=(
	"$url/archive/refs/tags/v$pkgver.tar.gz"
)
makedepends=("go")
arch=('x86_64' 'aarch64')
sha512sums=('5c505847d8b6f8f6997686809170d8ca2b64964950f4b02c4cfa7fe9ff434d8e828133839c683b65109e112288381efa327bc44ece96f6e6374aa3ac03cd618c')
conflicts=("${pkgname}-bin" "${pkgname}-git")

build() {
	cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-trimpath -modcacherw"
  go build -o "bin/$pkgname" ./cmd
}

package() {
	cd "$pkgname-$pkgver"
  install -D -m 0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -D -m 0755 -t "$pkgdir/usr/bin/" "bin/$pkgname"
}
