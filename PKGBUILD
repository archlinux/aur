# Maintainer: Deepu K Sasidharan <d4udts@gmail.com>
#
# Generated from deployment/aur/llamastash-bin/PKGBUILD.template by
# deployment/aur/packager.py during .github/workflows/release.yml.
# Do not edit aur-llamastash-bin/PKGBUILD by hand -- it is overwritten
# on every stable tag.
pkgname=llamastash-bin
_pkgname=llamastash
pkgver=0.6.1
pkgrel=1
pkgdesc='Zero-overhead, terminal-native local-LLM manager (prebuilt)'
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
sha256sums_x86_64=('5b042727501f49bd130a5b2b7d6e7c1e55881608ec781e203d0b634b811cc7f0')
sha256sums_aarch64=('08bd969731882fec77fa9cca8aca92f0b8ae73835a9727e261bc5f22276eaea5')

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
