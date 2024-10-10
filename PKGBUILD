# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=codelldb-bin
_pkgname="${pkgname%-bin}"
pkgver=1.11.0
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

sha256sums=('c37a8c52bd7e81e5d12aa1c56f3c14496dde2c52198ab98a16369ee45890e8bd')
sha256sums_x86_64=('b857287f70a18a4fc2d7563aa9fdbcfa9cb2b37d5666fc78394fc8131ee335e2')
sha256sums_armv7h=('a22f1b38a94a94cb2cb814399de9da153cd2ddb2539b97353f05b60668fe0e9f')
sha256sums_aarch64=('ebbd358dddc1538384cdfb94823da85d13a7a3a4c3eac466de8bb5394f81386a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" LICENSE
  install -dm755    "$pkgdir/usr/lib/$_pkgname/"
  cp      -a  -t    "$pkgdir/usr/lib/$_pkgname" "$srcdir"/extension/*
  install -dm755    "$pkgdir/usr/bin/"
  ln      -s  -t    "$pkgdir/usr/bin/" "/usr/lib/$_pkgname/adapter/$_pkgname"
}
