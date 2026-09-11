pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.12
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.12.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.12/skwd-deck-steamworks-x86_64-1.0.0-beta.12.tar.xz")
sha256sums=('6ad28217d2624f3e45be0d6604f4990d6c5ffca24d17fc894308fb25bdd01c15')

build() {
  cd "$pkgname-1.0.0-beta.12"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.12"
  ./distribution/install.sh steamworks "$pkgdir"
}
