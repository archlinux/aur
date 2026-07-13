# Maintainer: Deepu K Sasidharan <d4udts@gmail.com>
#
# Generated from deployment/aur/llamastash-bin/PKGBUILD.template by
# deployment/aur/packager.py during .github/workflows/release.yml.
# Do not edit aur-llamastash-bin/PKGBUILD by hand -- it is overwritten
# on every stable tag.
pkgname=llamastash-bin
_pkgname=llamastash
pkgver=0.0.6
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
sha256sums_x86_64=('233640488f286307b7beeeb442b7748519cef2c325c8bca1d57c65f13c97baef')
sha256sums_aarch64=('07da943b2e0943cc9bc125234ae6aba3cb52820e3ecca4c721b16623c95cd931')

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
