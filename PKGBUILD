# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=servedir
pkgver=0.2.r0.g6721fc2
pkgrel=1
pkgdesc='Simple tool for sharing and uploading files through HTTP protocol.'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/servedir'
depends=()
makedepends=('go')
source=("${pkgname}::git+https://github.com/mikolajb/servedir.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}/
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg2 'Compiling...'

  cd ${srcdir}/${pkgname}/
  GOPATH="$GOPATH:$srcdir" go build -o servedir
}

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}/servedir ${pkgdir}/usr/bin/servedir
}
