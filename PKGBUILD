# Maintainer: Alon Levy alon@moranoa.com
pkgname=albumfetch
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI tool written in Zig that displays random albums in the terminal"
arch=('x86_64')
url="https://github.com/StuffedRat46810/albumfetch-zig"
license=('MIT')
depends=('glibc')
makedepends=('zig')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('44f4110431d7efb8bccc4efc8fb0d26c8367049a154bceb1af9b5079aafc6264')

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
