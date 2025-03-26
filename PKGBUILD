# Maintainer: Arnab Bose <hirak99+arch@gmail.com>

pkgname=keyshift
pkgver=1.0.11
pkgrel=1
pkgdesc="Keyshift - keyboard remapping utility for Linux"
arch=('any')
url="https://github.com/hirak99/$pkgname"
license=('Apache')
depends=()
# Note: 'catch2' is no longer needed. Testing is done on git workflow.
makedepends=()

# Third party sources should ideally be git .tar.gz, even if forked.
# This is for security, in provenance of origin, also helps us to know and
# update vulnerabilities by automated git checks.

# Note: If third party is updated, do the following -
# 1. Create a new release ("v1.0.1").
# 2. Update version (e.g. _digestppver=1.0.1).
# 3. Compute and update the corresponding md5sum.
_digestppver=1.0.0

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "digestpp_v${_digestppver}.tar.gz::https://github.com/hirak99/digestpp/archive/refs/tags/v${_digestppver}.tar.gz"
)
md5sums=(
  'fbdb698291dc58d7c4607c65d72ce47d'
  '698fa3454dddb558af0953668fc697fa'
)

options=(!debug)

# Extract third party sources.
prepare() {
  cd "$pkgname"-"$pkgver"
  cd ./src/thirdparty
  # This directory is not pulled from tag; should be empty if it exists.
  rm -rf ./digestpp
  ln -s "$srcdir/digestpp-${_digestppver}" ./digestpp
}

package() {
  cd "$pkgname"-"$pkgver"
  ./build_minimal.sh

  install -Dm 755 ./build/keyshift "$pkgdir"/usr/bin/keyshift
}

