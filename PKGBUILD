# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-astroplan
pkgver=0.4
pkgrel=2
pkgdesc="A python package to help astronomers plan observations"
arch=('i686' 'x86_64')
url="https://astroplan.readthedocs.io/en/latest/"
license=('BSD')
depends=('python>=3.5' 'python-numpy' 'python-astropy>=1.3' 'python-pytz')
makedepends=('cython')
optdepends=('python-matplotlib: Plotting support'
            'python-pytest-mpl: Testing the plot function'
            'python-astroquery: Astroquery support')
source=("https://files.pythonhosted.org/packages/source/a/astroplan/astroplan-${pkgver}.tar.gz"
        'astroplan-ephem.patch')
md5sums=('8ac6dec44aadae0b98775658856a4f01'
         '3b992c8bd610d72ff2c61a059bb20e30')

prepare() {
    cd "${srcdir}/astroplan-${pkgver}"
    patch -Np1 -i "${srcdir}/astroplan-ephem.patch"
}

package() {
  cd ${srcdir}/astroplan-${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}
