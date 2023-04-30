# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=codelldb-bin
_pkgname="${pkgname%-bin}"
pkgver=1.9.1
pkgrel=1
pkgdesc="A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode)"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/vadimcn/codelldb"
license=("MIT")
provides=("$_pkgname" "vscode-lldb")
conflicts=("$_pkgname")

source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-x86_64-linux.vsix")
source_armv7h=("$_pkgname-$pkgver-arm-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-arm-linux.vsix")
source_aarch64=("$_pkgname-$pkgver-aarch64-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-aarch64-linux.vsix")

sha256sums=('e3a9e17f93a298e693a43509264358506f6a0572ece05482f73374068981ea84')
sha256sums_x86_64=('ce97d6022c905a6ce90d91bff2a52e6ca523a8bcd054d7c260c3b75f762de05d')
sha256sums_armv7h=('8a784f9a32329b5c59c816800a171c34c4a5cbf164f28cf308999d3926fdb04d')
sha256sums_aarch64=('78b0469a1dfc9e7a0f77f88e36c185a176ab19f1b1411e4ff5afa1fc929e8e44')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" LICENSE
  install -dm755    "$pkgdir/usr/lib/$_pkgname/"
  cp      -a  -t    "$pkgdir/usr/lib/$_pkgname" "$srcdir"/extension/*
  install -dm755    "$pkgdir/usr/bin/"
  ln      -s  -t    "$pkgdir/usr/bin/" "/usr/lib/$_pkgname/adapter/$_pkgname"
}
