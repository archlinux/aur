# Maintainer: envolution
# Contributor: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-novas
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=3.1.1.6
pkgrel=1
pkgdesc="The United States Naval Observatory NOVAS astronomy library"
arch=('i686' 'x86_64')
url="https://www.usno.navy.mil/USNO/astronomical-applications/software-products/novas"
optdepends=('python-novas_de405: high-accuracy ephemeris data set')
license=('custom')
makedepends=('python')
checkdepends=('python-novas_de405')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('50119749976aa47fdebf6b42c71f55db')

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation

}
check() {
  cd ${_pyname}-${pkgver}
  pytest
}

package() {
  cd ${_pyname}-${pkgver}

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README*
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --skip-build
}
