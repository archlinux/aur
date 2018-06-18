# Maintainer: David Runge <dave@sleepmap.de>

pkgname=python-osc
pkgver=1.6.7
pkgrel=1
pkgdesc='Open Sound Control server and client implementations in pure Python'
arch=('any')
url="https://github.com/attwad/python-osc"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/attwad/${pkgname}/master/LICENSE.txt")
sha512sums=('fa0a6f72b82431b2842d7d1af9c404e10a43cbc16c7e14902d2b2c01b40a49430dcb637cfe657cfdcd541dc26e6770987ae9d43a9bffd6cc94adad64ae20a0a3'
            'aa647966e7fb62ffcd7bfc1e56a8ebe38e8384a36c14e07fec4ccf3be91ffa1b3bbd9798901fa7956056c26d124f067582366bdb9581db1f742291c86e64e39d')

check() {
  cd "${pkgname}-${pkgver}"
  python setup.py test
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"

  install -vDm 644 ../LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
