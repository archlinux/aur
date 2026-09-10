pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.11
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.11.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.11/skwd-deck-steamworks-x86_64-1.0.0-beta.11.tar.xz")
sha256sums=('6c17d081bba03f701ca2e011e1e6b863c8905bc1831989d5597c5185185a6811')

build() {
  cd "$pkgname-1.0.0-beta.11"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.11"
  ./distribution/install.sh steamworks "$pkgdir"
}
