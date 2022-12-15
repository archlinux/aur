# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: xantares

pkgname=python-baycomp
pkgver=1.0.2
pkgrel=2
pkgdesc='Library for Bayesian comparison of classifiers'
url='https://github.com/janezd/baycomp'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python-scipy' 'python-matplotlib')
source=("https://pypi.io/packages/source/b/baycomp/baycomp-${pkgver}.tar.gz")
sha256sums=('c43472c16bd7cdf4884dd4c73dd307e4a3da7097fe49c83cd5e88d75142923b0')

prepare() {
    cd "${srcdir}"/baycomp-${pkgver}
}

build() {
    cd "${srcdir}"/baycomp-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/baycomp-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -rf "${pkgdir}${site_packages}/tests/"
}
