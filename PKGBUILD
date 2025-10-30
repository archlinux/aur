# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=codelldb-bin
_pkgname="${pkgname%-bin}"
pkgver=1.11.8
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

sha256sums=('ea6a2d61a9d61fed6bdc0568851a5c95c1873bf0e088e509d6ee3743f85da1be')
sha256sums_x86_64=('98c90cc08427d04f83a726931e6cad99a039c3d796788a0d683ed5064e41be42')
sha256sums_armv7h=('1bbb92ef4498ad5e6fd87584e6e7aa2f72a71c9fac2d47eaf13deda7f1ae63e0')
sha256sums_aarch64=('ea8b93043231e40eca98da58e1c53f1ea4e9431498b29bde11a32c7ad815d1f4')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" LICENSE
  install -dm755    "$pkgdir/usr/lib/$_pkgname/"
  cp      -a  -t    "$pkgdir/usr/lib/$_pkgname" "$srcdir"/extension/*
  install -dm755    "$pkgdir/usr/bin/"
  ln      -s  -t    "$pkgdir/usr/bin/" "/usr/lib/$_pkgname/adapter/$_pkgname"
}
