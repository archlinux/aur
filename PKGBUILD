# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=pat-git
pkgver=0.13.1.r134.gabc1234
pkgrel=1
pkgdesc="Cross-platform Winlink client with Web UI (git version)"
arch=('x86_64')
url="https://github.com/la5nta/pat"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=('pat')
conflicts=('pat')
install=pat-git.install
source=("git+https://github.com/la5nta/pat.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pat"
  git describe --tags --long --always | sed 's/^v//; s/-/r/; s/-/./'
}

build() {
  cd "$srcdir/pat"
  go build -o pat
}

package() {
  cd "$srcdir/pat"

  # Install binary
  install -Dm755 pat "$pkgdir/usr/bin/pat"

  # License & docs
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Web UI
  install -d "$pkgdir/usr/share/pat/web"
  cp -r web/* "$pkgdir/usr/share/pat/web"
}
