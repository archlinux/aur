# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-sherpa
pkgver=4.9.1
pkgrel=1
pkgdesc="Modeling and fitting package for scientific data analysis"
arch=('i686' 'x86_64')
url="http://cxc.cfa.harvard.edu/contrib/sherpa/"
license=('GPL')
depends=('python>=3.5' 'python-numpy' 'fftw')
makedepends=('python-setuptools' 'gcc-fortran')
optdepends=('python-matplotlib: Graphical output'
            'python-astropy: Data I/O support'
            'ds9-bin: Imaging requires'
            'xpa: Imaging requires'
            'python-pytest>=3.3: For testing suite'
            'python-mock: For testing suite'
            'python-pytest-xvfb: For testing suite')
install=python-sherpa.install
source=("https://files.pythonhosted.org/packages/source/s/sherpa/sherpa-${pkgver}.tar.gz"
        'sherpa_local_fftw.patch')
md5sums=('bc86d545e5d7764b1601e7fe0d8e76a6'
         'd1823cc7683442d92450fadff7aed362')

prepare() {
    cd "${srcdir}/sherpa-${pkgver}"
    patch -Np1 -i "${srcdir}/sherpa_local_fftw.patch"
}

package() {
    unset LDFLAGS
    cd ${srcdir}/sherpa-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
