pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.27
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.27.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.27/skwd-deck-steamworks-x86_64-1.0.0-beta.27.tar.xz")
sha256sums=('5411a52f50f3b2000141fb1919a5f96e68d6005131800a00cfd850e5cac5f801')

build() {
  cd "$pkgname-1.0.0-beta.27"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.27"
  ./distribution/install.sh steamworks "$pkgdir"
}
