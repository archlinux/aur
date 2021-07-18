# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-ufo2ft'
_pkgname='ufo2ft'
pkgver='2.21.0'
pkgrel=1
pkgdesc="A bridge from UFOs to FontTools objects."
url="https://github.com/googlefonts/ufo2ft"
checkdepends=('python-compreffor' 'python-pytest' 'python-skia-pathops')
depends=('python-booleanoperations' 'python-cffsubr' 'python-cu2qu' 'python-defcon' 'python-fonttools>=4.21.1')
makedepends=('python-setuptools')
optdepends=('python-compreffor')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip"
    "install.patch")
sha256sums=('8387241b9a36ed906a0b99afc80d58cee72ea5266ec0016f17456f765be73300'
            'a98918585cbee73d9c04fc70c7629c2de1a47b491c000e7c9432f9c3e4bbbfb5')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p1 -i ../install.patch
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH=Lib pytest tests
}
