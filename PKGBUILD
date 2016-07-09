# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=github-release
pkgver=0.6.2
pkgrel=2
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts)"
arch=('i686' 'x86_64')
url="https://github.com/aktau/${pkgname}"
makedepends=('go')
depends=('glibc')
conflicts=("${pkgname}-bin")
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=("SKIP")

build() {
  cd $srcdir/$pkgname-$pkgver
  GOROOT=/usr/lib/go GOPATH=$HOME/go PATH=$PATH:$GOROOT/bin make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm755 "${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
