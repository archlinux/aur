# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=codelldb-bin
_pkgname="${pkgname%-bin}"
pkgver=1.12.2
pkgrel=2
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

sha256sums=('34e2aae22f5b5e4b03f854159d9a35f1c5527e0eb11b817e7d5e8bd513bb05e5')
sha256sums_x86_64=('b85b45a8570051d535b0927c6c9da11c39f3a056c73559064647faf7f37f637d')
sha256sums_armv7h=('37fdac94b1c8706437b44f82d5d1b776202cdc923008f086a7e11ead8ea199d1')
sha256sums_aarch64=('f7c83ad67cc860fe6d753e8123b57a4db89c1fb00aef4b85a2f858334cdbaeb0')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" LICENSE
  install -dm755    "$pkgdir/usr/lib/$_pkgname/"
  cp      -a  -t    "$pkgdir/usr/lib/$_pkgname" "$srcdir"/extension/*
  install -dm755    "$pkgdir/usr/bin/"
  ln      -s  -t    "$pkgdir/usr/bin/" "/usr/lib/$_pkgname/adapter/$_pkgname"
  ln      -s  -t    "$pkgdir/usr/bin/" "/usr/lib/$_pkgname/bin/$_pkgname-launch"
}
