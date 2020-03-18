# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

_name=Mini-AMF
pkgname=python-mini-amf
pkgver=0.9.1
pkgrel=2
pkgdesc="Minimal AMF encoder and decoder for Python"
arch=(any)
url="https://github.com/zackw/mini-amf"
license=(custom:MIT)
depends=(python-six python-defusedxml)
makedepends=(python-setuptools)
provides=(python-mini-amf=${pkgver})
conflicts=(python-mini-amf)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        fix-setup-py38.patch)
sha256sums=('0c7839dc843b738cdcf5548e85558e7ebd89a9f6fd029751b0bb4d8b0ca4275b'
            '4aaf5b09e59a689487380cc8cd3052ac5cf29ed92a1eb24faa2b212dcf629fc1')

prepare () {
	cd "${_name}-${pkgver}"
	patch -p0 < "${srcdir}/fix-setup-py38.patch"
}

build () {
	cd "${_name}-${pkgver}"
	python setup.py build
}

package () {
	cd "${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
