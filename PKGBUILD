# Maintainer: Sakamoto Shizue <supremeep at yandex dot ru>
pkgname=cptest
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool for competitve programming. Feed programs fixed inputs, compare their outputs against expected ones."
arch=('x86_64')
url="https://github.com/kuredoro/cptest"
license=('BSD')
depends=()
makedepends=(
  'git'
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuredoro/cptest/archive/v${pkgver}.tar.gz")
sha256sums=('cbd39cf0df66845550b569a163bde71fee88ff0f5277fed72d6c625839a4a108')

# With pacman 6 arriving a rebuild of yay will be necessary, if you upgrade pacman without upgrading yay at the same time, yay will not run after.
# I'm bumping the pkgrel so it shows up on the upgrade list (and will do so when pacman transitions from staging->core)
# In case you end up with a non-functioning yay after the upgrade follow the
# instructions on the github page

build() {
  export GOPATH="$srcdir"/gopath

  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  go build -o build/cptest ./cmd/cptest
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mv ./build/cptest $pkgdir/usr/bin
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
