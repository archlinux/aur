# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=killpy
pkgver=1.3.1
pkgrel=1
pkgdesc="Find and delete unused Python virtual environments"
arch=('any')
url="https://github.com/tlaloc-es/killpy"
license=('MIT')
depends=('python' 'python-click' 'python-packaging' 'python-rich' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/k/killpy/killpy-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tlaloc-es/killpy/${pkgver}/LICENSE")
sha256sums=('43ea13d9437e95c04760039f63df08833c073b60a630b42e1454b1ef15e6baad'
            '49007fcb1e605aae86a2695cf19db19b81eddf3f359f59618f1869b92c0fb2c5')

build() {
  cd "killpy-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "killpy-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
