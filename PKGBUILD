# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=codelldb-bin
_pkgname="${pkgname%-bin}"
pkgver=1.12.0
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

sha256sums=('9dbeed978470d2c503a704f0ec90c2b28ad3e1a7ea6a6a7c4dae6a579f485dd7')
sha256sums_x86_64=('4795692aea5bafca5961b10a488e65952f2add82bf2ec2a584fdea31c1cd2570')
sha256sums_armv7h=('8131ea01e93c2b33fcb4125c169052079470e444fe2e193c7b86c00a1bfe3e5d')
sha256sums_aarch64=('246aaadda6a40a586067a42aafff89d481d72d87b403699f1b7c5fa3a939c45c')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" LICENSE
  install -dm755    "$pkgdir/usr/lib/$_pkgname/"
  cp      -a  -t    "$pkgdir/usr/lib/$_pkgname" "$srcdir"/extension/*
  install -dm755    "$pkgdir/usr/bin/"
  ln      -s  -t    "$pkgdir/usr/bin/" "/usr/lib/$_pkgname/adapter/$_pkgname"
}
