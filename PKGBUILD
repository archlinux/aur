# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-copier
_name=${pkgname#python-}
pkgver=7.0.1
pkgrel=2
pkgdesc='Library and command-line utility for rendering projects templates'
arch=('any')
url='https://github.com/pykong/copier'
license=('MIT')
depends=(
  'python-backports.cached_property'
  'python-colorama'
  'python-dunamai'
  'python-importlib-metadata'
  'python-iteration-utilities'
  'python-jinja'
  'python-jinja2-ansible-filters'
  'python-packaging'
  'python-pathspec'
  'python-plumbum'
  'python-pydantic'
  'python-pygments'
  'python-pyyaml-include'
  'python-questionary'
  'python-typing_extensions'
  'python-yaml'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3d81916dad27d003674070b365bfcd965eb69d5a97920b226d6db88a6e7193d6')

prepare() {
	cd "$srcdir/$_name-$pkgver"
  # Bypass stupid dependency check
  sed -i "14s|0.8.0|0.9.0|" setup.py
}

build() {
	cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
