# Maintainer: Jeff Barfield (noprobelm[at]protonmail[dot]org)

_gitname=terminaltables
pkgname=python-terminaltables-git
pkgver=v3.1.9.r3.g8020b8c
pkgrel=1
arch=('any')
pkgdesc='Generate simple tables in terminals from a nested list of strings.'
license=('MIT')
makedepends=('git' 'python-setuptools')
provides=('python-terminaltables')
conflicts=('python-terminaltables')
url='https://github.com/matthewdeanmartin/terminaltables'
source=("git+https://github.com/matthewdeanmartin/terminaltables.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_gitname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_gitname}
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 example*.py -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
