# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=codelldb-bin
_pkgname="${pkgname%-bin}"
pkgver=1.12.3
pkgrel=1
pkgdesc="A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode)"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/vadimcn/codelldb"
license=("MIT")
provides=("$_pkgname" "vscode-lldb")
conflicts=("$_pkgname")

source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-linux-x64.vsix")
source_armv7h=("$_pkgname-$pkgver-arm-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-linux-armhf.vsix")
source_aarch64=("$_pkgname-$pkgver-aarch64-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-linux-arm64.vsix")

sha256sums=('8a7d183014766e695d90c14c3a4f24a5e7937eb7b0d4954b074a85bd00f4f841')
sha256sums_x86_64=('1cd7f386598022b51a5b93b9ffa23e812b23f519cfe1833384ec4bef4bfd1be1')
sha256sums_armv7h=('20294f0ea876a73c662bb09b1814551a859dc77156564b62c75acf1088ecaf30')
sha256sums_aarch64=('0887f67d440554617894266f80706b700907c36b95e6e49d23b95a0e05318101')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" LICENSE
  install -dm755    "$pkgdir/usr/lib/$_pkgname/"
  cp      -a  -t    "$pkgdir/usr/lib/$_pkgname" "$srcdir"/extension/*
  install -dm755    "$pkgdir/usr/bin/"
  ln      -s  -t    "$pkgdir/usr/bin/" "/usr/lib/$_pkgname/adapter/$_pkgname"
  ln      -s  -t    "$pkgdir/usr/bin/" "/usr/lib/$_pkgname/bin/$_pkgname-launch"
}
