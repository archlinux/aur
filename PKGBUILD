# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=tldr-python-client
pkgver='0.3'
pkgrel=2
pkgdesc='Command line client for tldr, a collection of simplified and community-driven man pages.'
url='https://github.com/tldr-pages/tldr-python-client'
provides=('tldr-client')
conflicts=('tldr-client')
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
_commit='8069f7a9ad395eb61db1cd9098db47ab2f3b6936'
source=("git+https://github.com/tldr-pages/${pkgname}.git#commit=${_commit}"
		'https://github.com/tldr-pages/tldr-python-client/pull/32.patch')
md5sums=('SKIP'
		'617fa4da21aefb6b5688d97d5fb12955')


build() {
	cd "${srcdir}/${pkgname}"

	# https://github.com/tldr-pages/tldr-python-client/pull/32
	patch -Np1 -i ../32.patch

	python setup.py build
}


package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

