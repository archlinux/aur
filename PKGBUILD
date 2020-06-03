# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
pkgname=python-markdown-checklist-git
pkgver=r23.63ca633
pkgrel=1
pkgdesc='Python Markdown extension for lists of tasks with checkboxes'
arch=('any')
url='https://github.com/FND/markdown-checklist'
license=('MIT')
depends=('python-markdown')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=('python-markdown-checklist')
source=('git+https://github.com/FND/markdown-checklist.git')
sha256sums=('SKIP')

# for convenience
_pkgname=markdown-checklist

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python setup.py build
}

check() {
    cd "$_pkgname"
    pytest
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
