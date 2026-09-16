pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.15
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.15.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.15/skwd-deck-steamworks-x86_64-1.0.0-beta.15.tar.xz")
sha256sums=('a31451622f6cff6c09027f37159408148d5bb23b0f80606da0e0ed5c04ca3bbd')

build() {
  cd "$pkgname-1.0.0-beta.15"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.15"
  ./distribution/install.sh steamworks "$pkgdir"
}
