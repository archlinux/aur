pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.9
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.9.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.9/skwd-deck-steamworks-x86_64-1.0.0-beta.9.tar.xz")
sha256sums=('10f48d81403bb25780c3699182a1ff73dcab1f4a1fc33ef9055597cf2e521b90')

build() {
  cd "$pkgname-1.0.0-beta.9"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.9"
  ./distribution/install.sh steamworks "$pkgdir"
}
