
pkgname=python-sphinx-git
pkgver=r11542.271ea125f
pkgrel=1
arch=('any')
url='http://sphinx.pocoo.org/'
license=('BSD')
makedepends=('git'
  'python-setuptools'
  'python-docutils'
  'python-jinja'
  'python-pygments'
  'python-six'
)
checkdepends=(
  'python-nose'
  'texlive-latexextra'
  'python-snowballstemmer'
  'python-babel'
  'python-sphinx-alabaster-theme'
  'python-sphinx_rtd_theme'
)
source=("git+https://github.com/sphinx-doc/sphinx.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/sphinx"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/sphinx
  make build
}

check() {
  cd "$srcdir"/sphinx
  make test
  rm -r tests
}

package() {
  pkgdesc='Python3 documentation generator'
  depends=('python-jinja' 'python-pygments' 'python-docutils' 'python-sphinx_rtd_theme' 'python-sphinx-alabaster-theme' 'python-babel' 
'python-snowballstemmer' 'python-six')
  optdepends=('texlive-latexextra: for generation of PDF documentation')
  provides=('python-sphinx')
  conflicts=('python-sphinx')

  cd sphinx
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/sphinx/LICENSE "$pkgdir"/usr/share/licenses/python-sphinx/LICENSE
}

