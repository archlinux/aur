# Maintainer: Abdul Khaliq <a.khaliq@outlook.my>

pkgname=subvars
pkgver=0.1.4
pkgrel=1
pkgdesc="Substitute environment variables from command line for template driven configuration files."
url='https://subvars.lmno.pk'
arch=("i686" "x86_64" "aarch64")
license=("MIT")
depends=("glibc")
makedepends=('go>=1.16')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kha7iq/subvars/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  b5331f0170a73a1341c732580ce9f515e5679e97230f3d0a7cd5e19b8dfacbe8
)

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  go build -ldflags "-linkmode=external -s -w -X main.version=${pkgver}" -o ${pkgname} .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
