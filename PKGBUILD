# Maintainer: envolution
# Contributor: Astro Benzene <universebenzene at sina dot com>
pkgname=python-novas_de405
_pyname=${pkgname#python-}
pkgver=1997.1
pkgrel=2
pkgdesc="JPL DE405 ephemeris needed by the NOVAS package"
arch=('i686' 'x86_64')
url="https://github.com/brandon-rhodes/python-novas"
license=('custom')
#checkdepends=('python-pytest' 'python2-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('86341c564b5b97ca8693f1b25135efd8')

package() {
  cd ${_pyname}-${pkgver}
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
  python_site_packages=$(python3 -c "import site; print(site.getsitepackages()[0])")
  # Fix permissions for DE405.bin (ensure it's world-readable)
  chmod 644 "${pkgdir}${python_site_packages}/novas_de405/DE405.bin"
}
