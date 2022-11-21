# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: j605

pkgname='python38-perf'
pkgver=2.3.1
pkgrel=1
pkgdesc='Toolkit to run Python benchmarks'
url='https://github.com/haypo/perf'
arch=('any')
license=('MIT')
depends=('python' 'python38-setuptools' 'python38-six')
makedepends=('python' 'python38-setuptools' 'python38-six')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/vstinner/perf/archive/${pkgver}.tar.gz)
sha256sums=('82c67986f06b14de040608847546131056177a6cc39be21540c87a3c0fc3e009')
sha512sums=('56ac84962199bf3504766b6bc6eb89cbcb8367bcd64a6756eacb6d9ea7469df85a0f1d5b75c37c374ad731c425168469fd2dcc53ec789c6057abc5e84815a1e4')

build() {
  (cd pyperf-${pkgver}
    python3.8 setup.py build
  )
}

package(){
  cd pyperf-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
