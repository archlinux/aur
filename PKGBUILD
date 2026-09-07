pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.10
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.10.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.10/skwd-deck-steamworks-x86_64-1.0.0-beta.10.tar.xz")
sha256sums=('cb22ff8a361a5faf1f636833a823080dac2f643d6b6afc5cf86d02af4cf375e3')

build() {
  cd "$pkgname-1.0.0-beta.10"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.10"
  ./distribution/install.sh steamworks "$pkgdir"
}
