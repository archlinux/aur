# Maintainer: Łukasz Dywicki <luke@code-house.org>

pkgname=terraform-provider-nexus
pkgver=1.10.2
pkgrel=1
pkgdesc="Terraform provider to configure Sonatype Nexus using it's API."
url="https://github.com/datadrivers/terraform-provider-nexus"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/datadrivers/terraform-provider-nexus/archive/v$pkgver.tar.gz"
)
sha512sums=('19fa5fc2c1792aa23be92067c20004ed42f58024d51f10071deec0ca62a2d1342f28f9bfbc563ee8b669d60a26ef024de5b07dfb27ed6b5a4c4ded2445308726')

build() {
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd $pkgname-$pkgver
  go build .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}