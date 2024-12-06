# Maintainer: Danny Grove <aur@dannygrove.com>
pkgname=kustomize-sops
pkgver=4.3.1
pkgrel=2
pkgdesc="KSOPS - A Flexible Kustomize Plugin for SOPS Encrypted Resources"
url="https://github.com/viaduct-ai/$pkgname"
license=("Apache")
arch=("x86_64" "aarch64")
conflicts=("ksops-bin")
provides=("ksops")
makedepends=("go")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
install=${pkgname}.install
sha256sums=('e7248a158d503a73d9f658cc9ac0ccf16a3d8efb856d93ca50a97f7b89332516')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-trimpath -modcacherw"
  go build -o ksops .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0644 -t $pkgdir/usr/share/licenses/$pkgname/LICENSE LICENSE
  install -D -m 0755 -t $pkgdir/opt/kustomize/viaduct.ai/v1/ksops/ksops ksops
}
