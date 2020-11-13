# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pantable
pkgname=python-$_name-git
pkgver=0.12.4.r9.g964b436
pkgrel=1
pkgdesc='CSV Tables in Markdown: Pandoc Filter for CSV Tables'
arch=('any')
url="https://github.com/ickc/$_name"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_py_deps=('panflute>=2'
          'yaml')
depends=('pandoc' 'python' "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --tags --abbrev=7 HEAD | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
	python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
