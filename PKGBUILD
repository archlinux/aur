# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

pkgname='buck'
pkgver='2017.11.16.01'
pkgrel=1
pkgdesc='A fast build system that encourages the creation of small, reusable modules over a variety of platforms and languages.'
arch=('any')
depends=('java-runtime-headless>=7' 'python2')
makedepends=('java-environment>=7' 'apache-ant')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
url='https://buckbuild.com'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4cabece42f1d1d6b31088150d56c23740ed7167a66e1584aba4b205c5260d369')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ant
  ./bin/buck build buck
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  BINPATH=$(./bin/buck targets --show_output buck | cut -d' ' -f2)
  install -Dm 755 "${BINPATH}" "${pkgdir}/usr/bin/buck"
}
