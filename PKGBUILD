# Maintainer: quenyen
pkgname=weatherreport
pkgver=1.1.0
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
sha256sums=('23a899e8d6ef990440e1a6eafb34690eebc409f8f042f2d4bb46dabcd55d7b6b')

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
