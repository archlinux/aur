# Maintainer: DanManN <dnahimov@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-thinc-git
_origpkgname=thinc
pkgver=7.0.0.dev6.r2716.f26cb395
pkgrel=1
pkgdesc="Practical Machine Learning for NLP"
arch=("x86_64")
url="https://github.com/explosion/thinc"
license=("MIT")
depends=('cython'
         'python-numpy'
         'python-murmurhash'
         'python-cymem'
         'python-preshed'
         'python-wrapt'
         'python-plac'
         'python-tqdm'
         'python-srsly'
         'python-wasabi'
         'python-six'
         'python'
         'python-hypothesis'
         'python-pytest'
         'python-mock'
         'python-blis'
         'flake8'
)
makedepends=("python-setuptools")
optdepends=("python-spacy: examples")
provides=('python-thinc')
conflicts=('python-thinc')
source=("git+https://github.com/explosion/$_origpkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_origpkgname"
  printf "%s.r%s.%s" "$(cat thinc/about.py | grep -i version | grep -v '#' | cut -d '"' -f2 | head -n 1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_origpkgname"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
