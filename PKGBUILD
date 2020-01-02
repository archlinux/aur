# Maintainer: David Runge <dvzrv@archlinux.org>

_name=orderedmultidict
pkgname=python2-orderedmultidict
pkgver=1.0.1
pkgrel=4
pkgdesc="Ordered multivalue dictionary that retains method parity with dict."
url="https://github.com/gruns/orderedmultidict"
license=('Unlicense')
depends=('python2-six')
makedepends=('python2-setuptools')
checkdepends=('python2-configparser' 'python2-entrypoints' 'python2-enum34'
'python2-flake8' 'python2-functools32' 'python2-mccabe' 'python2-pycodestyle'
'python2-pyflakes' 'python2-pytest' 'python2-typing')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('5a826bb46dfe9d7e6e2159bf545612a35dd0f1bb5817c1fd78e0f3f4019f9144b36be94af08f87e881a310f593091df09702d001624c377f559a30f64b219c24')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH="build:${PYTHONPATH}" pytest2
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 {API,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
