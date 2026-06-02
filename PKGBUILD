# Maintainer: Deepu K Sasidharan <d4udts@gmail.com>
#
# Generated from deployment/aur/llamastash-bin/PKGBUILD.template by
# deployment/aur/packager.py during .github/workflows/release.yml.
# Do not edit aur-llamastash-bin/PKGBUILD by hand -- it is overwritten
# on every stable tag.
pkgname=llamastash-bin
_pkgname=llamastash
pkgver=0.0.2
pkgrel=1
pkgdesc='Fast, keyboard-driven TUI for launching local llama.cpp models (prebuilt)'
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
sha256sums_x86_64=('841c6db10812023267fa1cdc85a0f6e59246eb48a3c42310f8e352047ec28e6a')
sha256sums_aarch64=('95efb433a815b8c8604673a784a73cbd7dfa1e1b1dba4789436097bceb886894')

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
