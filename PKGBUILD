# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=arcgis
pkgname=python-${_pkgname}
pkgver=1.7.0
pkgrel=1
pkgdesc="ArcGIS API for Python"
arch=('x86_64')
url="https://developers.arcgis.com/python/"
license=('custom')
depends=(
    'python-six'
    'python-pandas'
    'python-numpy'
    'python-pyshp'
    'python-matplotlib'
    'jupyter-notebook'
    'python-ipywidgets'
    'jupyter-widgetsnbextension'
    'python-keyring'
)
makedepends=(
    'python-setuptools'
)
optdepends=(
    'python-beautifulsoup4: OAuth2 authenticating support'
    'python-dill: needed to create Python toolboxes from methods'
)
source=(
    "https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
    "LICENSE.pdf::http://www.esri.com/LEGAL/pdfs/mla_e204_e300/english.pdf"
)
sha512sums=('784c3e98fde24d4f805db77a40e4a911a5459ae45b5562ca1c55c523f1d85cfbf44cb8fabe0f2b2f852d241b339b8c66e0ca68c745f36f0835283180867fdd55'
            'a3df14c41af501e198468faa379f8f9101510476acde2f91697879677e6f587275310def73a2765043731f5fe785817081e8e8b9e132122eaf59bb6309be61f2')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 "${srcdir}/LICENSE.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
