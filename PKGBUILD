# Contributor: Murli Tawari <kraanzu@gmail.com>

pkgname=dooit-git
_pkgname=${pkgname%-git}
pkgver=3.1.0.r2.g8a92524
pkgrel=1
pkgdesc="A todo manager that you didn't ask for, but needed!"
url="https://github.com/kraanzu/dooit"
arch=('any')
license=('MIT')
depends=(
    'python'
    'python-yaml'
    'python-tzlocal'
    'python-textual'
    'python-dateutil'
    'python-sqlalchemy'
    'python-platformdirs'
    'python-click'
    'python-pyperclip'
)
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-poetry')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags --abbrev=7 --match='v[0-9]*' |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
