# Maintainer: Alon Levy alon@moranoa.com
pkgname=albumfetch
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI tool written in Zig that displays random albums in the terminal"
arch=('x86_64')
url="https://github.com/StuffedRat46810/albumfetch"
license=('MIT')
depends=('glibc')
makedepends=('zig')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c65508e70704ed4533a819f963588fd85bced82d5b815e0acf4301abf8d948d5')

build() {
  cd "${pkgname}-${pkgver}"
  # Building as ReleaseSafe as recommended in your README
  zig build -Doptimize=ReleaseSafe --prefix /usr
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install the binary
  install -Dm755 "zig-out/bin/albumfetch" "${pkgdir}/usr/bin/albumfetch"

  # Install the license file
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Optional: Install the README as documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
