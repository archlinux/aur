# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescale-prometheus
pkgver=0.1.0.beta.4
_pkgver="${pkgver/.beta/-beta}" # temporary workaround, remove once package is out of beta
pkgrel=1
pkgdesc="An open source analytical platform for Prometheus metrics"
arch=('x86_64')
url="https://github.com/timescale/timescale-prometheus"
license=('Apache')
groups=()
depends=()
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
noextract=()
b2sums=('579313a01302531eafabe324de7e1e80f01d8e8d491bdf49924f9809707141e591079f6f2efb0043a64aa787b0c56753875bcc97c7156a68e34ccb6f5d2fef02')
validpgpkeys=()

prepare() {
  cd "$pkgname-$_pkgver"
  go mod vendor
}

build() {
  cd "$pkgname-$_pkgver/cmd/$pkgname"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$_pkgver/cmd/$pkgname/$pkgname"
}
