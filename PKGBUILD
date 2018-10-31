# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=python-hookmeup
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc='A Git hook to automate your Pipenv and Django workflow'
provides=('python-hookmeup')
arch=('any')
url='https://github.com/djmoch/hookmeup'
license=('MIT')
depends=('python')
makedepends=('python-pip' 'flit')
checkdepends=('python-pytest'
              'python-pytest-cov'
              'python-pytest-mock'
              'python-mock')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "${_name}-${pkgver}.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz.asc")
validpgpkeys=('72A97F7072DDCE28058DEF30323C9F1784BDDD43')
sha256sums=('cd20f4a73db367849a73d4b5a712e7d066d1875a6d21fda4e826bf55146f81ec'
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
