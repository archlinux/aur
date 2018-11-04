# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
pkgbase=python-pytest-flakes
pkgname=('python-pytest-flakes' 'python2-pytest-flakes')
_name=${pkgbase#python-}
pkgver=4.0.0
pkgrel=1
pkgdesc='pytest plugin to check source code with pyflakes'
arch=('any')
url='https://github.com/fschulze/pytest-flakes'
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('341964bf5760ebbdde9619f68a17d5632c674c3f6903ef66daa0a4f540b3d143')

prepare() {
  cp -a ${_name}-$pkgver{,-py2}
}

build()
{
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-py2"
  python setup.py build
}

package_python-pytest-flakes()
{
  depends=('python' 'python-pyflakes')
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pytest-flakes()
{
  depends=('python2' 'python2-pyflakes')
  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=PKGBUILD sts=2 sw=2 et
