# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=(python2-dulwich python-dulwich)
pkgver=0.19.2
pkgrel=2
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=('any')
url='https://www.dulwich.io/'
license=('GPL2')
depends=()
makedepends=('python2' 'python')
options=(!emptydirs)
source=("https://github.com/jelmer/dulwich/archive/dulwich-${pkgver}.tar.gz")
md5sums=('279c9b467aeafdf397d3a51b1d2364c7')

build() {
  cd "dulwich-dulwich-${pkgver}"
  python2 setup.py build
  python setup.py build
}

package_python-dulwich() {
  depends=('python')
  cd "dulwich-dulwich-${pkgver}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

package_python2-dulwich() {
  depends=('python2')
  cd "dulwich-dulwich-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
  mv "${pkgdir}"/usr/bin/dulwich{,2}
  mv "${pkgdir}"/usr/bin/dul-receive-pack{,2}
  mv "${pkgdir}"/usr/bin/dul-upload-pack{,2}
}

# vim:set ts=2 sw=2 et:
