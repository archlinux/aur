# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=codelldb-bin
_pkgname="${pkgname%-bin}"
_reponame=vscode-lldb
pkgver=1.7.2
pkgrel=1
pkgdesc='A native debugger extension for VSCode based on LLDB'
arch=('x86_64')
url="https://github.com/vadimcn/$_reponame"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/v$pkgver/$_pkgname-x86_64-linux.vsix"
  "$_reponame-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99b919587030fc77a6a88d4ea393646f485b7550910e59e9e425049c9d1530de'
            'd818c0ffab6c52d3804fda40f2c5cd80a36567a5f1094490b3b768b34a6a1a99')

package() {
  install -dm755 "$pkgdir/usr/lib/$_pkgname/"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$_reponame-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  cp -a "$srcdir/extension"/* "$pkgdir/usr/lib/$_pkgname/"
  ln -s "/usr/lib/$_pkgname/adapter/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
