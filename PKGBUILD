pkgname=skwd-deck-steamworks
pkgver=1.0.0_beta.21
pkgrel=1
pkgdesc='Optional Steam Client Workshop backend for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(LicenseRef-Proprietary)
depends=(gcc-libs glibc skwd-deck)
makedepends=(cargo lld)
optdepends=('steam: running Steam client used by the backend')
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.21.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.21/skwd-deck-steamworks-x86_64-1.0.0-beta.21.tar.xz")
sha256sums=('68692267a17fa78382634a1b4d9864ccdb80ee496a4cc42f96d658202b8a799c')

build() {
  cd "$pkgname-1.0.0-beta.21"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh steamworks
}

package() {
  cd "$pkgname-1.0.0-beta.21"
  ./distribution/install.sh steamworks "$pkgdir"
}
