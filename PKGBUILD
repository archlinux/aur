# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

pkgname='buck'
pkgver='2017.10.01.01'
pkgrel=1
pkgdesc='A fast build system that encourages the creation of small, reusable modules over a variety of platforms and languages.'
arch=('any')
depends=('java-runtime-headless>=7' 'python2')
makedepends=('java-environment>=7' 'apache-ant')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
url='https://buckbuild.com'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('abf8feee6d435d467f62122983a9e161b7ab3f0eb0dc5b0179fc12709d5bcb32')

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
