# Maintainer: Dylan <dylan@flickmag.net>
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=python-daemonocle
pkgver=1.2.3
pkgrel=3
pkgdesc="Python library for creating Unix daemons"
url="https://github.com/jnrbsn/daemonocle"
depends=('python-click' 'python-psutil')
makedepends=('python-setuptools' 'python-build' 'python-installer')
license=('MIT')
arch=('any')
source=("${url}/archive/v${pkgver}.tar.gz"
        "fix-get_terminal_size.patch")
sha512sums=('aa3da48dd779a52e20e26166b99b1c3e56661b9dcfbbd65f0318bdd969210f4ff460e493821e38a04ce9d126cc93677d2537f58cdc60647afb4e66bcfc48bec1'
            'b6b7adc5016ead2c5b2e1d946c8751735c217ead5723da457dd2253e19a88e1500d005c88e650d15da8e867b8ce0bf955e46814d85ac55b6630f92f8b9020d51')

build() {
	cd "${srcdir}/daemonocle-${pkgver}"
	patch -p1 < "${srcdir}"/fix-get_terminal_size.patch
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/daemonocle-${pkgver}"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
}
