# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
pkgname=python-sregistry
_pkgname=sregistry
pkgver=0.2.35
pkgrel=2
pkgdesc="Singularity Registry Client CLI tool (built with [registry] support)"
arch=('any')
url="https://singularityhub.github.io/sregistry-cli/"
license=('MPL2')
depends=('python-spython'
         'python-requests'
         'python-pygments'
         'python-requests-toolbelt'
         'python-dateutils>=0.6.6'
         'python-sqlalchemy')
provides=('singularity-registry-cli')
optdepends=('singularity-container: to use and manipulate Singularity Containers')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('58a2d85abd87d2dc72422eb054416ef75585bf602dbba1c6d4aa6d3bc4e1259c')

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
