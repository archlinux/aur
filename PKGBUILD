pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.28
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.28.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.28/skwd-deck-steamworks-x86_64-1.0.0-beta.28.tar.xz")
sha256sums=('8293c49b48a8ea21a9fb64c4a06dd6585ba455fb08f7bee95f200d1ed2dc2911')

build() {
  cd "$pkgname-1.0.0-beta.28"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.28"
  ./distribution/install.sh steamworks "$pkgdir"
}
