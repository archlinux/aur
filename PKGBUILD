pkgname=tempesta
pkgver=0.0.64
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')

case "$arch" in
  "x86_64")
    source+=(${pkgname}-${pkgver}-${arch}::"https://github.com/x71c9/tempesta/releases/download/v${pkgver}/tempesta-${arch}-unknown-linux-gnu.tar.gz")
    sha256sums=('SKIP')
    ;;
  "aarch64")
    source+=(${pkgname}-${pkgver}-${arch}::"https://github.com/x71c9/tempesta/releases/download/v${pkgver}/tempesta-${arch}-unknown-linux-gnu.tar.gz")
    sha256sums=('SKIP')
    ;;
  *)
    echo "Error: Unsupported architecture $arch. Please open a github issue if you want to support it: https://github.com/x71c9/tempesta/issues" >&2
    exit 1
    ;;
esac
build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
} 
package() {
  install -Dm755 "${srcdir}/${pkgname}/target/release/tempesta" "${pkgdir}/usr/bin/tempesta"
}
