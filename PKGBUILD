pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.16
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.16.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.16/skwd-deck-steamworks-x86_64-1.0.0-beta.16.tar.xz")
sha256sums=('557c6b9112756cab0a4ff7358b71fbd19f65d2ec00b6eef6cfe7f264be7d2b78')

build() {
  cd "$pkgname-1.0.0-beta.16"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.16"
  ./distribution/install.sh steamworks "$pkgdir"
}
