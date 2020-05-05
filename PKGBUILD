# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=github-release
pkgver=0.8.1
pkgrel=1
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts)"
arch=('i686' 'x86_64')
url="https://github.com/aktau/${pkgname}"
makedepends=('go')
depends=('glibc' 'git')
conflicts=("${pkgname}-bin")
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c094f4d63bfc78fe1354443bdcbce44103a067f85fd935965270f10c26d503822001b1462be2c3b36852023c0f09979032b795e14cd57f88b135811789b359d5')

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
