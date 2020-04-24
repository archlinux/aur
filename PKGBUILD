# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pypsdd
_gitname="pypsdd"
pkgver=0.1
pkgrel=1
pkgdesc="A Python 3 port of the Probabilistic Sentential Decision Diagrams (PSDD) Package PyPSDD."
arch=('any')
url="https://github.com/art-ai/pypsdd"
license=('Apache 2.0')
depends=('python')
optdepends=('pypy3')
makedepends=('git')
source=("git+https://github.com/RenatoGeh/pypsdd")
sha256sums=('SKIP')

# Testing purposes
#prepare() {
#  cd "$_gitname" || exit 1
#  git checkout futurize
#  git pull
#}

build() {
  cd "$_gitname" || exit 1
  python3 setup.py build
}

package() {
  cd "$_gitname" || exit 1
  python3 setup.py install --root="$pkgdir" --optimize=2 --skip-build
}

check() {
  cd "${_gitname}/${_gitname}/tests" || exit 1
  for f in *.py; do
    echo "Testing $f..."
    python3 "$f" || (echo "Test $f failed!" && exit 2)
  done
}

