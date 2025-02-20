# Maintainer: Aaron Liu <aaronliu0130 at gmail.com>
pkgname=python-foobeef
_reponame=pyfoobeef
pkgver=0.9.0.4
_commit='a1488c038dc7d08a3665fb4ff5cdfdc85181426b'
pkgrel=1
pkgdesc="Control Beefweb clients such as Foobar2000 and DeaDBeeF"
arch=('any')
url='https://github.com/Ada-Kru/pyfoobeef'
license=('MIT')
depends=('python>=3.6'
		'python-urllib3'
		'python-aiohttp>=3'
		'python-aiohttp-sse-client')
makedepends=('python-build'
			'python-installer'
			'python-setuptools'
			'python-wheel')
# checkdepends=('python-asynctest') # tests do not work due to the moribund asynctest
source=("https://github.com/Ada-Kru/${_reponame}/archive/${_commit}.tar.gz")
sha256sums=('055bed464c1997af468c5d13cd77c2474805aa8bddf06d05c50014c539206117')

prepare() {
	mv ${_reponame}-${_commit} ${pkgname}-${pkgver}
}

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
