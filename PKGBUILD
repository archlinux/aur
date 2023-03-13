# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=codelldb-bin
_pkgname="${pkgname%-bin}"
pkgver=1.9.0
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

sha256sums=('dfec6ebd468aa1c1880fe546eade7e8f77b29424fb9a88adb4c5253f03e7150e')
sha256sums_x86_64=('27af4b0821fd1843b04d3fa0ea1ecfb202cda6b869b67205685a29079caa22b7')
sha256sums_armv7h=('211a68f25a1e28323e2f3101cd89438888b1e4bc182988c40f6a7a4162f390b1')
sha256sums_aarch64=('879ac7cf1c6a7944f82c42ee8b8d3da79abf084d8539abba6551ac6b6bb5ce54')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" LICENSE
  install -dm755    "$pkgdir/usr/lib/$_pkgname/"
  cp      -a  -t    "$pkgdir/usr/lib/$_pkgname" "$srcdir"/extension/*
  install -dm755    "$pkgdir/usr/bin/"
  ln      -s  -t    "$pkgdir/usr/bin/" "/usr/lib/$_pkgname/adapter/$_pkgname"
}
