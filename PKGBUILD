# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Simon Hanna <simon dot hanna AT serve-me DOT info>

_name=nose2
pkgname=python-nose2
pkgver=0.9.1
pkgrel=1
pkgdesc="The next generation of nicer testing for python"
arch=('any')
url="https://github.com/nose-devs/nose2"
license=('BSD')
depends=('python-coverage' 'python-setuptools' 'python-six')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('40b3a40f731be00ed3aa6b3d20c432d48d41e4d4373f0650c8ebe0245f9a8459dfea9ae24b25134f64b4d34343808d2afb4a489eda9a261c7867199fbf3901fe')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm 644 license.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # docs
  install -vDm 644 {AUTHORS,README.rst} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
