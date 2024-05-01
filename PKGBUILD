# Maintainer: Martin Rys <rys.rs/contact>

pkgname=python-wekan
_reponame=python-wekan
pkgver=0.1.9
pkgrel=4
pkgdesc="Client for interacting with the WeKan® REST-API"
url="https://pypi.org/project/${_reponame}/"
arch=(any)
license=('BSD-3-Clause')
depends=('python' 'python-dateutil' 'python-requests')
makedepends=('python-setuptools' 'cython' 'git')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-${pkgver}.tar.gz"
"${pkgname}-13.patch::https://github.com/bastianwenske/python-wekan/pull/13.patch"
"${pkgname}-14.patch::https://github.com/bastianwenske/python-wekan/pull/14.patch"
"${pkgname}-17.patch::https://github.com/bastianwenske/python-wekan/pull/17.patch"
"${pkgname}-18.patch::https://github.com/bastianwenske/python-wekan/pull/18.patch")
sha256sums=('ea3d37c3b9b73b9da5cf6795ab86ba13dfbae32ce2cd7b5616c8dfb941f01e7c'
            'a395161daa65b277266883339aaaba6e1b6b9ec2ee7b7a6d42014d3846a9cd58'
            'd102dc1d450399d2ceb3ab2fe3fd457ee372c7a1e06a0f4fc6d8bc577b88e6a7'
            '482ba5a04817862b58a814566b4e41c69dc55aa28c3c96300fd6c8db04789611'
            'e7ef6824808672f095c772b91223e48a079ff3c81d84c8131d36eba194b51e23')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/${pkgname}-14.patch"
	patch -p1 < "${srcdir}/${pkgname}-17.patch"
	patch -p1 < "${srcdir}/${pkgname}-18.patch"
}

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
