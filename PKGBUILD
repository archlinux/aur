# Maintainer: Harryhaha <harry_haha@foxmail.com>

pkgname=python-sphinx_tippy
_name=${pkgname#python-}
pkgver=0.4.3
pkgrel=2
pkgdesc='Get rich tool tips in your sphinx documentation!'
url='https://github.com/sphinx-extensions2/sphinx-tippy'
license=('MIT')
arch=('any')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
depends=('python-sphinx')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core')

source=('version.patch'
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")

sha256sums=('8e8d43608c7e8939d11310028d3a2c2e32708d17647c9ec535e40985f081c39a'
	    '255abee0aed8085fdb9ab0cc595cd7a45748ae7f4662156e500a17a3f73ad63d')

prepare() {
    cd $_name-$pkgver
    patch < ../version.patch
}

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
