# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
pkgname=python-sregistry
_pkgname=sregistry
pkgver=0.0.89
pkgrel=2
pkgdesc="Singularity Registry Client CLI tool (built with [registry] support)"
arch=('any')
url="https://singularityhub.github.io/sregistry-cli/"
license=('AGPL3')
depends=('python-spython' 'python-requests' 'python-pygments'
         'python-chardet' 'python-idna' 'python-urllib3' 'python-certifi'
         'python-sqlalchemy' 'python-dateutils')
provides=('singularity-registry-cli')
optdepends=('singularity-container: to use and manipulate Singularity Containers')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c836ed5fe68de318593c0ef5da6847f7033c2778d352aac9ee11eb9d6cb4b2f6')

prepare() {
	cd "${_pkgname}-${pkgver}"
    # activate registry client support
    sed -e 's/install_requires = INSTALL_REQUIRES,/install_requires = REGISTRY,/' -i setup.py
}

build() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
    /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
