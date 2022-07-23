# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=codelldb-bin
_pkgname="${pkgname%-bin}"
pkgver=1.7.2
pkgrel=1
pkgdesc='A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/vadimcn/vscode-lldb"
license=('MIT')
provides=("$_pkgname" "vscode-lldb")
conflicts=("$_pkgname")

source=("vscode-lldb-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$_pkgname-x86_64-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-x86_64-linux.vsix")
source_armv7h=("$_pkgname-arm-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-arm-linux.vsix")
source_aarch64=("$_pkgname-aarch64-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-aarch64-linux.vsix")

sha256sums=('d818c0ffab6c52d3804fda40f2c5cd80a36567a5f1094490b3b768b34a6a1a99')
sha256sums_x86_64=('99b919587030fc77a6a88d4ea393646f485b7550910e59e9e425049c9d1530de')
sha256sums_armv7h=('5342387d52fa4f657c5db33fdf80e20e0317fa09588a06800aeeeec50b93ccbf')
sha256sums_aarch64=('c95a7c791a409d348be2438d41e2940ef8b075536c0df683cfee4a14735ec044')

package() {
  install -dm755 "$pkgdir/usr/lib/$_pkgname/"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/vscode-lldb-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  cp -a "$srcdir/extension"/* "$pkgdir/usr/lib/$_pkgname/"
  ln -s "/usr/lib/$_pkgname/adapter/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
