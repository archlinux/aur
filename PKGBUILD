# Maintainer: Geequlim
pkgname=t3-code-cli-bin
pkgver=0.1.12
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
sha256sums_x86_64=('9ba3db46e3554fb9970fd5ede9e823c2f6d6f6763f40340bd4c8ef6b09501c54')
source_aarch64=("https://github.com/pingdotgg/t3code/releases/download/v${pkgver}/t3-${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('29cfbab19117aa436f1700382afb9cfe5d7ef47609cabba9356271a0bca5ad98')

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
