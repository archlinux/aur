# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-git
pkgver=v1.4.1.r0.g99c5526
_binver=v0.7.0
pkgrel=1
pkgdesc="A command runner with healthchecks.io integration"
url="https://github.com/bdd/runitor"
license=('0BSD')
arch=('x86_64')
makedepends=('go')
source=("$pkgname"::"git+https://github.com/bdd/runitor.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}
  rm -f build/runitor-*-linux-amd64
  ${srcdir}/${pkgname}/scripts/build dist
}

package() {
  install -D ${srcdir}/${pkgname}/build/runitor-*-linux-amd64 ${pkgdir}/usr/bin/runitor
}
