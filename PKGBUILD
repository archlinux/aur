# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=poliastro
pkgname=python-${_pyname}-doc
pkgver=0.11.1
pkgrel=1
pkgdesc="Documentation for Python poliastro module"
arch=('i686' 'x86_64')
url="http://docs.poliastro.space/"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'pandoc' 'python-pandas' 'python-retrying' 'python-beautifulsoup4' 'python-plotly' 'python-nbsphinx' 'python-numba')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'nbsphinx_errors.patch')
md5sums=('365466f0072800998cbbd44cc724c696'
         '275e900feea65f14512bcc7fe2cd555a')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/nbsphinx_errors.patch"

}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
