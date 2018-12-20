# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=python-hookmeup
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=2
pkgdesc='A Git hook to automate your Pipenv and Django workflow'
arch=('any')
url='https://git.danielmoch.com/hookmeup'
license=('MIT')
depends=('python')
makedepends=('python-pip' 'flit')
checkdepends=('python-pytest'
              'python-pytest-cov'
              'python-pytest-mock'
              'python-mock')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('72A97F7072DDCE28058DEF30323C9F1784BDDD43')
sha256sums=('4a7f1be5b0ab20e1209235cebe14b18f08b2239abd56a7b94566fc1c9ab94d8a'
            'SKIP')

build()
{
  cd "${srcdir}/${_name}-${pkgver}"
  flit build --format wheel
}

check()
{
  cd "${srcdir}/${_name}-${pkgver}"
  python -m pytest
}

package()
{
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" dist/${_name}-${pkgver}-py2.py3-none-any.whl
}

# vim: ft=PKGBUILD sts=2 sw=2 et
