pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.24
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.24.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.24/skwd-deck-steamworks-x86_64-1.0.0-beta.24.tar.xz")
sha256sums=('25d97c97ec8f97136821f79d158faac17d2692b3e3e2320315dfd8490d6a4d36')

build() {
  cd "$pkgname-1.0.0-beta.24"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.24"
  ./distribution/install.sh steamworks "$pkgdir"
}
