# Maintainer: Łukasz Dywicki <luke@code-house.org>

pkgname=terraform-provider-nexus
pkgver=1.9.1
pkgrel=1
pkgdesc="Terraform provider to configure Sonatype Nexus using it's API."
url="https://github.com/datadrivers/terraform-provider-nexus"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/datadrivers/terraform-provider-nexus/archive/v$pkgver.tar.gz"
)
sha512sums=('5a2244118770896a28440cde6dba178cca75e35260ccdb7acc497fabe3b16a3bfd2d1d5bcef8d206d67a4e1316dfd6e07fd3f9761994cdf52c8dca5bb76305fa')

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