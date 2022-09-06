# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-copier
_name=${pkgname#python-}
pkgver=6.1.0
pkgrel=1
pkgdesc='Library and command-line utility for rendering projects templates'
arch=('any')
url='https://github.com/pykong/copier'
license=('MIT')
depends=('python-yaml'
         'python-jinja'
         'python-regex'
         'python-plumbum'
         'python-pathspec'
         'python-pydantic'
         'python-colorama'
         'python-packaging'
         'python-pytest-xdist'
         'python-pyyaml-include')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d3b399285763e97a1c3c49cbc7e0d3b3cea2f05b680f652ff58d59a5b59f3a3c')

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
