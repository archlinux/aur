pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.18
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.18.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.18/skwd-deck-steamworks-x86_64-1.0.0-beta.18.tar.xz")
sha256sums=('e2dbe9d7fddada56d93c3cd14be9635b745d9ef9eb76a5049a791b71be00254b')

build() {
  cd "$pkgname-1.0.0-beta.18"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.18"
  ./distribution/install.sh steamworks "$pkgdir"
}
