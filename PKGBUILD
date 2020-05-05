# Maintainer: quenyen
pkgname=weatherreport
pkgver=1.0.0
pkgrel=1
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
sha256sums=('e2ffe6f0bbd7d4501ff945f847693c7114717d8846f14b38c399328855a802c8')

build() {
  export GOPATH="$srcdir"/gopath
  cd "$srcdir/$pkgname-v$pkgver"
  go get github.com/mmcdole/gofeed
  go build
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -D $pkgname-v$pkgver $pkgdir/usr/bin/$pkgname
}

