# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: xantares

pkgname=python-baycomp
_pkgname="${pkgname#python-}"
pkgver=1.0.3
pkgrel=4
pkgdesc='Library for Bayesian comparison of classifiers'
url='https://github.com/janezd/baycomp'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python-scipy>=0.19.1' 'python-matplotlib>=2.1.2' 'python-numpy>=1.13.1')
optdepends=('python-pystan>=3.4.0')
_src_name="${_pkgname/-/_}-${pkgver}"
source=("https://pypi.org/packages/source/${_pkgname::1}/${_pkgname}/${_src_name}.tar.gz")
sha256sums=('32b25ad7b16d5b251ddb9f6110a32d7b3953b987096da1d25ef277935d25daec')

prepare() {
    cd "${_src_name}"
}

build() {
    cd "${_src_name}"
    python setup.py build
}

package() {
    cd "${_src_name}"
    python setup.py install --root=${pkgdir} --optimize=1

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -rf "${pkgdir}${site_packages}/tests/"
}
