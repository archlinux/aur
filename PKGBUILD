pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.14.2
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.14.2.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.14.2/skwd-deck-steamworks-x86_64-1.0.0-beta.14.2.tar.xz")
sha256sums=('1bb727589cde83033c342bb0f7c42f10c5f7b12edeaa40118832e9867a33cb0d')

build() {
  cd "$pkgname-1.0.0-beta.14.2"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.14.2"
  ./distribution/install.sh steamworks "$pkgdir"
}
