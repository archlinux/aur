# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=github-release
pkgver=0.7.2
pkgrel=1
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts)"
arch=('i686' 'x86_64')
url="https://github.com/aktau/${pkgname}"
makedepends=('go')
depends=('glibc' 'git')
conflicts=("${pkgname}-bin")
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b339e5c21200b4079c08f9f9a722d3ce990d184ee5300536c6b32bf64fc7dbc95881fe8fb42f8274a33350b290cf3a5b588e5ee784e173b631b9dc2decd284df')

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
