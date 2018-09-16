# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=python-hookmeup
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc='A Git hook to automate your Pipenv and Django workflow'
provides=('python-hookmeup')
conflicts=('python-hookmeup')
arch=('any')
url='https://github.com/djmoch/hookmeup'
license=('MIT')
depends=('python')
makedepends=('python-pip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8499238460da0b33e263be039343016ef55be1dc4d815f87c3bc24ea924f03fc')

build()
{
  cd "${srcdir}/${_name}-${pkgver}"
  flit build --format wheel
}

package()
{
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" dist/${_name}-${pkgver}-py2.py3-none-any.whl
}

# vim: ft=PKGBUILD sts=2 sw=2 et
