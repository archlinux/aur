# Maintainer: Martin Rys <rys.rs/contact>

pkgname=python-wekan
_reponame=python-wekan
pkgver=0.1.9
pkgrel=2
pkgdesc="Client for interacting with the WeKan® REST-API"
url="https://pypi.org/project/${_reponame}/"
arch=(any)
license=('BSD-3-Clause')
depends=('python' 'python-dateutil' 'python-requests')
makedepends=('python-setuptools' 'cython' 'git')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-${pkgver}.tar.gz"
"${pkgname}-17.patch::https://github.com/bastianwenske/python-wekan/pull/17.patch")
sha256sums=('ea3d37c3b9b73b9da5cf6795ab86ba13dfbae32ce2cd7b5616c8dfb941f01e7c'
            '482ba5a04817862b58a814566b4e41c69dc55aa28c3c96300fd6c8db04789611')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/${pkgname}-17.patch"
}

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
