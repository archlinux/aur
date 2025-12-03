# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-mdtex2html
pkgver=1.3.2
pkgrel=1
pkgdesc="python3-library to convert Markdown with included LaTeX-Formulas to HTML with MathML"
arch=('any')
url="https://github.com/polarwinkel/mdtex2html"
license=('LGPL-2.1-only')
depends=('python'
         'python-markdown'
         'python-latex2mathml')
makedepends=('git'
             'python-build'
             'python-setuptools'
             'python-wheel'
             'python-installer')
# Use commit for now because v1.3.2 tag doesn't include version code changes
_commit='4caeffd6e791b94e692bb354c1e7d9b58b6e0b11'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}"
  git clean -dfx
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
