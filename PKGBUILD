# Maintainer: Murli Tawari <kraanzu@gmail.com>

pkgname=dooit-git
_pkgname=${pkgname%-git}
pkgver=0.2.1.r2.g840f3a2
pkgrel=1
pkgdesc="A todo manager that you didn't ask for, but needed!"
url="https://github.com/kraanzu/dooit"
arch=('any')
license=('MIT')
depends=('python' 'python-pyperclip' 'python-pyaml' 'python-poetry' 'python-textual')
makedepends=('python-build' 'python-wheel' 'python-installer' 'flake8' 'python-black' 'python-pre-commit')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags --abbrev=7 --match='v[0-9]*' |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    echo "$pkgdir"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
