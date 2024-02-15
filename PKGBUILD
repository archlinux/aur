# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: xantares

pkgname=python-baycomp
pkgver=1.0.3
pkgrel=2
pkgdesc='Library for Bayesian comparison of classifiers'
url='https://pypi.org/project/baycomp'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python-scipy>=0.19.1' 'python-matplotlib>=2.1.2' 'python-numpy>=1.13.1')
optdepends=('python-pystan>=3.4.0')
source=("https://pypi.org/packages/source/b/baycomp/baycomp-${pkgver}.tar.gz")
sha256sums=('32b25ad7b16d5b251ddb9f6110a32d7b3953b987096da1d25ef277935d25daec')

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
