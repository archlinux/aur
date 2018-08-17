# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
pkgname=python-sregistry
_pkgname=sregistry
pkgver=0.0.94
pkgrel=1
pkgdesc="Singularity Registry Client CLI tool (built with [registry] support)"
arch=('any')
url="https://singularityhub.github.io/sregistry-cli/"
license=('AGPL3')
depends=('python-spython'
         'python-requests'
         'python-pygments'
         'python-requests-toolbelt'
         'python-dateutils'
         'python-sqlalchemy')
provides=('singularity-registry-cli')
optdepends=('singularity-container: to use and manipulate Singularity Containers')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('215393b7259120121337686b98b16568f859d58ff8cc9994c76efab725da37fb')

prepare() {
	cd "${_pkgname}-${pkgver}"
    # activate registry client support
    sed -e 's/install_requires = INSTALL_REQUIRES,/install_requires = INSTALL_REQUIRES + REGISTRY,/' -i setup.py
}

build() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
