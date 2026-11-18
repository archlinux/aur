# Maintainer: Geequlim
pkgname=t3-code-cli-bin
pkgver=0.1.10
pkgrel=2
pkgdesc='Self-contained T3 Code server and command-line interface'
arch=('x86_64' 'aarch64')
url='https://github.com/pingdotgg/t3code'
license=('MIT')
depends=('glibc' 'gcc-libs')
options=('!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/pingdotgg/t3code/v${pkgver}/LICENSE")
sha256sums=('935d8f2af0c703f9c39517ee57cc4930b19d02d533be930b63f0e82f93614b43')
source_x86_64=("https://github.com/pingdotgg/t3code/releases/download/v${pkgver}/t3-${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('9bea9d36a217299a0af880e8c347b536ed6a9a2f5bf328a695d174d63628c5e8')
source_aarch64=("https://github.com/pingdotgg/t3code/releases/download/v${pkgver}/t3-${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('5ffbd224f53d0f827279825347a7ebf5a7ac98ad5c1347d47409f30aa2a1e425')

package() {
  local upstream_arch
  case "$CARCH" in
    x86_64) upstream_arch=x64 ;;
    aarch64) upstream_arch=arm64 ;;
  esac

  install -d "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin"
  cp -a "$srcdir/t3-${pkgver}-linux-${upstream_arch}/." "$pkgdir/opt/$pkgname/"
  ln -s "/opt/$pkgname/t3" "$pkgdir/usr/bin/t3"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
