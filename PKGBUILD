pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.23
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.23.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.23/skwd-deck-steamworks-x86_64-1.0.0-beta.23.tar.xz")
sha256sums=('1b787039638a55a595005c5ddc4210f0af239345b95dea01715d05fb9f7c5581')

build() {
  cd "$pkgname-1.0.0-beta.23"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.23"
  ./distribution/install.sh steamworks "$pkgdir"
}
