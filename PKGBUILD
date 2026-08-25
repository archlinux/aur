# Maintainer: Harryhaha <harry_haha@foxmail.com>

pkgname=python-libwiipy-git
_name=libwiipy
pkgver=r213.71ad5b9
pkgrel=1
pkgdesc='A modern Python library for handling files and formats used by the Wii.'
url='https://github.com/NinjaCheetah/libWiiPy'
license=('MIT')
arch=('any')
provides=("python-${_name}=${pkgver}")
conflicts=("python-${_name}")
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pycryptodome' 'python-requests' 'python-types-requests' 'python-sphinx' 'python-sphinx-book-theme' 'python-myst-parser' 'python-sphinx-copybutton' 'python-sphinx_tippy' 'python-sphinx_design')

source=("${_name}::git+${url}.git")

sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 $srcdir/$_name/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
