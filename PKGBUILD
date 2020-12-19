# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pantable
pkgname=python-$_name-git
pkgver=0.13.1.r4.g76034d9
pkgrel=1
pkgdesc='CSV Tables in Markdown: Pandoc Filter for CSV Tables'
arch=('any')
url="https://github.com/ickc/$_name"
license=('GPL3')
_py_deps=('panflute>=2'
          'yaml')
depends=('pandoc>=2.11.2'
		 'python'
		 "${_py_deps[@]/#/python-}")
makedepends=('python-pip')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --always --tags --abbrev=7 HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname}"
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
