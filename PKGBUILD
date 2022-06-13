# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-hug
_module=${pkgname#python-}
pkgver='2.6.1'
pkgrel=1
pkgdesc="A Python framework that makes developing APIs as simple as possible, but no simpler"
url="https://github.com/hugapi/hug"
depends=('python-falcon' 'python-requests' 'python-setuptools')
makedepends=('python-pytest-runner')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz"
		"falcon_ver.patch")
sha256sums=('b0edace2acb618873779c9ce6ecf9165db54fef95c22262f5700fcdd9febaec9'
            '9d059c9bafb31528d118ec78ff5c7e0028ecb98d417076f3e6d26ff117e1244d')

prepare() {
    cd ${_module}-${pkgver}
    patch -p1 < ../falcon_ver.patch
}

build() {
	cd ${_module}-${pkgver}
	python setup.py build
}

package() {
	cd ${_module}-${pkgver}
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
