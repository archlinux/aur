# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=codelldb-bin
_pkgname="${pkgname%-bin}"
pkgver=1.7.3
pkgrel=1
pkgdesc='A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/vadimcn/vscode-lldb"
license=('MIT')
provides=("$_pkgname" "vscode-lldb")
conflicts=("$_pkgname")

source=("vscode-lldb-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-x86_64-linux.vsix")
source_armv7h=("$_pkgname-$pkgver-arm-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-arm-linux.vsix")
source_aarch64=("$_pkgname-$pkgver-aarch64-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-aarch64-linux.vsix")

sha256sums=('699d3e7041a72d5ab5bd2004906223a4ced4ec316fa4d76fdab8b5e8ee83c32e')
sha256sums_x86_64=('68a6a086039cbed96c1b1db63b893253146ffdbeeb4ad74c318d20038045c52f')
sha256sums_armv7h=('1aee6faf642e8c30d244cb0c491bf977ad95f168a27a8ea7dc406650340713d6')
sha256sums_aarch64=('cde96ab160002f60b1bfca144bb056dc2ecaf09809fd3a19cc5e1ec40103de13')

package() {
  install -dm755 "$pkgdir/usr/lib/$_pkgname/"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/vscode-lldb-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  cp -a "$srcdir/extension"/* "$pkgdir/usr/lib/$_pkgname/"
  ln -s "/usr/lib/$_pkgname/adapter/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
