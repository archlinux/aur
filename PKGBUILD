# Maintainer: quenyen
pkgname=weatherreport
pkgver=1.2.0
pkgrel=2
pkgdesc="A command line tool to get the current weather conditions."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://gitlab.com/chrisfair/weatherreport"
license=('GPL')
depends=(
  'libalpm.so>=12'
  'sudo'
  'git'
)
makedepends=(
  'go'
)
source=("https://gitlab.com/chrisfair/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('2d6f87c261d549f07ce4de6d2f51f19bd48cb35387a989f453a854cf7bd99feb')
build() {
  export GOPATH="$srcdir"/gopath
  cd "$srcdir/$pkgname-v$pkgver"
  go get github.com/mmcdole/gofeed
  go get github.com/araddon/dateparse 
  go build
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -D $pkgname-v$pkgver $pkgdir/usr/bin/$pkgname
}
