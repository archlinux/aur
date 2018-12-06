# Maintainer: DanManN <dnahimov@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-spacy-git
_origpkgname=spaCy
pkgver=2.0.18.r8888.ae5601be
pkgrel=1
pkgdesc="A free open-source library for Natural Language Processing in Python"
arch=("x86_64")
url="https://spacy.io/"
license=("MIT")
depends=("cython"
        "python-numpy"
        "python-cymem"
        "python-preshed"
        "python-thinc"
        "python-murmurhash"
        "python-plac"
        "python-ujson"
        "python-dill"
        "python-regex"
        "python-requests"
        "python-pytest"
        "python-mock"
)
makedepends=("python-wheel")
provides=('python-spacy')
conflicts=('python-spacy')
source=("git+https://github.com/explosion/$_origpkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_origpkgname"
  printf "%s.r%s.%s" "$(cat spacy/about.py | grep -i version | grep -v '#' | cut -d "'" -f2 | head -n 1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_origpkgname"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
