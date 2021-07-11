# Maintainer: Abdul Khaliq <a.khaliq@outlook.my>

pkgname=subvars
pkgver=0.1.3
pkgrel=3
pkgdesc="Substitute environment variables from command line for template driven configuration files."
url='https://subvars.lmno.pk'
arch=("i686" "x86_64" "aarch64")
license=("APACHE")
depends=("glibc")
makedepends=('go>=1.16')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kha7iq/subvars/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  96e182efa8287d0e9ad9b7cab121c52e712bfa578bd76a7a1937e4476db71234
)

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  go build -ldflags "-linkmode=external -X github.com/kha7iq/subvars/main.version=v${pkgver}" -o ${pkgname} .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
