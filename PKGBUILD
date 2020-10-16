# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: DanManN <dnahimov@gmail.com>

pkgname=python-spacy-git
pkgver=2.3.0.r136.g3851300e8
pkgrel=1
pkgdesc="Free open-source library for Natural Language Processing in Python"
arch=(i686 x86_64 armv7h aarch64)
url="https://spacy.io/"
license=(MIT)
depends=(
    cython
    python-catalogue
    python-cymem
    python-murmurhash
    python-numpy
    python-pathlib
    python-plac
    python-preshed
    python-regex
    python-requests
    python-srsly
    python-thinc
    python-tqdm
    python-ujson
    python-wasabi
)
makedepends=(git python-wheel cython)
provides=(python-spacy)
conflicts=(python-spacy)
source=("git+https://github.com/explosion/spaCy.git")
md5sums=('SKIP')


prepare() {
    cd spaCy
}

pkgver() {
    cd spaCy
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd spaCy
    python setup.py build
}

package() {
    cd spaCy
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
