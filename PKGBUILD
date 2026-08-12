# Maintainer: Deepu K Sasidharan <d4udts@gmail.com>
#
# Generated from deployment/aur/llamastash-bin/PKGBUILD.template by
# deployment/aur/packager.py during .github/workflows/release.yml.
# Do not edit aur-llamastash-bin/PKGBUILD by hand -- it is overwritten
# on every stable tag.
pkgname=llamastash-bin
_pkgname=llamastash
pkgver=0.1.0
pkgrel=1
pkgdesc='Zero-overhead, terminal-native local-LLM launcher (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/llamastash/llamastash'
license=('MIT')
depends=('gcc-libs')
optdepends=('llama.cpp: provides llama-server (otherwise installed by `llamastash init`)')
provides=('llamastash')
conflicts=('llamastash' 'llamastash-git')

_release="$url/releases/download/v$pkgver"
source_x86_64=("$_release/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_release/$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('90932fc7c0dddfc49d85025025df1b0bc23b4645ccea73b37bf5ed6bcb922a54')
sha256sums_aarch64=('a69215f402fc7c70daf48042b82bc66c5b00acb3c637055a33bd22482f383e9c')

package() {
  local _triple
  case "$CARCH" in
    x86_64)  _triple='x86_64-unknown-linux-gnu' ;;
    aarch64) _triple='aarch64-unknown-linux-gnu' ;;
    *)       echo "::error:: unsupported CARCH: $CARCH" >&2; exit 1 ;;
  esac
  cd "$_pkgname-$pkgver-$_triple"
  install -Dm755 llamastash    "$pkgdir/usr/bin/llamastash"
  install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md  "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
