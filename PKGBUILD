pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.22
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.22.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.22/skwd-deck-steamworks-x86_64-1.0.0-beta.22.tar.xz")
sha256sums=('daf3786bd72a75afe247b9ee65f15dd2fdaad536c7d35915acf5cf15e9e49f02')

build() {
  cd "$pkgname-1.0.0-beta.22"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.22"
  ./distribution/install.sh steamworks "$pkgdir"
}
