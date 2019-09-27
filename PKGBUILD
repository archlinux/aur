# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="pylatex"
pkgname="python-${_name}-git"
pkgver=1.3.1.r721.ae3e591
pkgrel=2
pkgdesc="A Python library for creating LaTeX files (git version)"
arch=("any")
url="https://jeltef.github.io/PyLaTeX/"
license=("MIT")
depends=("python-ordered-set")
makedepends=("git" "python-setuptools")
optdepends=("python-numpy" "python-matplotlib" "python-quantities")
provides=("python-${_name}")
conflicts=("python-${_name}")
source=("${_name}::git+https://github.com/JelteF/PyLaTeX")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "%s.r%s.%s" \
         "$(git describe --tags --abbrev=0 | tr -d v)" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
