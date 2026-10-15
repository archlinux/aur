pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.26
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.26.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.26/skwd-deck-steamworks-x86_64-1.0.0-beta.26.tar.xz")
sha256sums=('e37a0d047eb5c8c4e135ad92dfd920b419c954817c0900ad4379d8ba1c44228e')

build() {
  cd "$pkgname-1.0.0-beta.26"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.26"
  ./distribution/install.sh steamworks "$pkgdir"
}
