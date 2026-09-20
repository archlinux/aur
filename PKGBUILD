pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.17
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.17.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.17/skwd-deck-steamworks-x86_64-1.0.0-beta.17.tar.xz")
sha256sums=('814827c1b896d5871221e9ea7a12badbfa41253d84d6f208134f6416868adba1')

build() {
  cd "$pkgname-1.0.0-beta.17"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.17"
  ./distribution/install.sh steamworks "$pkgdir"
}
