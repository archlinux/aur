# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=csvfilter
pkgver=0.1.r0.g8425b0a
pkgrel=1
pkgdesc='Filter for csv files.'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/csvfilter'
depends=()
makedepends=('go')
source=("${pkgname}::git+https://github.com/mikolajb/csvfilter.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}/
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg2 'Compiling...'

  cd ${srcdir}/${pkgname}/
  GOPATH="$GOPATH:$srcdir" go build -o csvfilter
}

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}/csvfilter ${pkgdir}/usr/bin/csvfilter
}
