# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-ufo2ft'
_pkgname='ufo2ft'
pkgver='2.23.0'
pkgrel=1
pkgdesc="A bridge from UFOs to FontTools objects."
url="https://github.com/googlefonts/ufo2ft"
checkdepends=('python-compreffor' 'python-pytest' 'python-skia-pathops')
depends=('python-booleanoperations' 'python-cffsubr' 'python-cu2qu' 'python-defcon' 'python-fonttools>=4.25.1')
makedepends=('python-setuptools')
optdepends=('python-compreffor')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip"
    "install.patch")
sha256sums=('02ceb5201f08b632b84046ddfd11233eaf3633437ccac9981ebf2d944d75616b'
            'a98918585cbee73d9c04fc70c7629c2de1a47b491c000e7c9432f9c3e4bbbfb5')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p1 -i ../install.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH=Lib pytest tests
}
