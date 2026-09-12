pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.13
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.13.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.13/skwd-deck-steamworks-x86_64-1.0.0-beta.13.tar.xz")
sha256sums=('32cb0e8a7ac3872ddf3dd576cc7307823e6d6d0f104f1d30d02fd5cea5d09592')

build() {
  cd "$pkgname-1.0.0-beta.13"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.13"
  ./distribution/install.sh steamworks "$pkgdir"
}
