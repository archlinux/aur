# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-terminal
pkgver=0.1.0
pkgrel=1
pkgdesc="Live terminal-art wallpapers for Niri"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-terminal"
license=('MIT')
depends=('niri' 'ttf-jetbrains-mono')
optdepends=('sysc-shell: select effects from the desktop')
makedepends=('go>=1.26.4')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-terminal/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0bc4399faa1e8a50d7f220e7ee5e38d6035b6963e1d255117b8b514577dd16e6')

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
