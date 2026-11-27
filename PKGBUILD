# Maintainer: Geequlim
pkgname=t3-code-cli-bin
pkgver=0.1.13
pkgrel=1
pkgdesc='Self-contained T3 Code server and command-line interface'
arch=('x86_64' 'aarch64')
url='https://github.com/Geequlim/aur-packages/tree/main/packages/t3-code-cli-bin'
license=('MIT')
depends=('glibc' 'gcc-libs')
options=('!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/pingdotgg/t3code/v${pkgver}/LICENSE")
sha256sums=('935d8f2af0c703f9c39517ee57cc4930b19d02d533be930b63f0e82f93614b43')
source_x86_64=("https://github.com/pingdotgg/t3code/releases/download/v${pkgver}/t3-${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('64e0f8446d3f618b157d4e5a0a6808ab3c8bf1a1b3e44eab3100e554be05e5d7')
source_aarch64=("https://github.com/pingdotgg/t3code/releases/download/v${pkgver}/t3-${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('c553c17db07030d032808989427db5022bf04027ebcec2218c69fb1a5fa1377f')

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
