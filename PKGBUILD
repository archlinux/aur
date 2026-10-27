# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-launch
pkgver=0.5.1
pkgrel=1
pkgdesc="Linux desktop application launcher and diagnostic CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-launch"
license=('BSD-3-Clause')
makedepends=('go>=1.26.10')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-launch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('77aa434174c5cf106ac404b363ed130a6a0a55ea6a4bf8cab83a4a802e6d0fa7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOTOOLCHAIN=local
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_ENABLED=0
  go build -buildvcs=false -o "${pkgname}" "./cmd/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
