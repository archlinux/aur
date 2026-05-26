# Maintainer: Alon Levy <alon@moranoa.com>
pkgname=albumfetch
pkgver=0.1.4
pkgrel=1
pkgdesc="A CLI tool written in Zig that displays random albums in the terminal"
arch=('x86_64')
url="https://github.com/StuffedRat46810/albumfetch"
license=('MIT')
depends=('glibc')
makedepends=('zig')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f70654fcd7a3e509a57e1cf4b091dd851f593f26e469c52bf397d305fd0da300')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Create the output directory explicitly
  mkdir -p zig-out/bin

  # Build with explicit cache and output directories
  zig build -Doptimize=ReleaseSafe \
    --prefix "${srcdir}/build" \
    --cache-dir "${srcdir}/zig-cache" \
    --global-cache-dir "${srcdir}/zig-global-cache"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install the binary from the build directory
  install -Dm755 "${srcdir}/build/bin/albumfetch" "${pkgdir}/usr/bin/albumfetch"

  # Install the license file
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Optional: Install the README as documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
