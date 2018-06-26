# Maintainer: rhssk <rssk@protonmail.com>
pkgname='kicost-git'
_gitname='kicost'
pkgver=r915.72c887d
pkgrel=1
pkgdesc="Build cost spreadsheet for a KiCad project"
url="https://xesscorp.github.io/KiCost"
depends=(
    'python'
    'python-setuptools'
    'python-beautifulsoup4'
    'python-xlsxwriter'
    'python-future'
    'python-lxml'
    'python-yattag'
    'python-tqdm'
    'python-currencyconverter'
    'python-pycountry'
    'python-requests'
)
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
license=('MIT')
arch=('any')
source=('git+https://github.com/xesscorp/kicost.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
    cd "$_gitname"

    python -m unittest tests.test_kicost
}

package() {
    cd "$_gitname"

    python setup.py install --root="$pkgdir" --optimize=1
}
