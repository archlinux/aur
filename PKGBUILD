# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=python-pywhat
_pkgname=pyWhat
pkgver=3.1.0
pkgrel=1
pkgdesc="Identify emails, IP addresses and more"
arch=('any')
depends=(
    'python'
    'python-click'
    'python-name-that-hash' #aur
    'python-rich'
)
makedepends=("python-setuptools" "python-dephell")
url="https://github.com/bee-san/pyWhat"
license=('GPL-3.0')
source=("$pkgname.tar.gz::https://github.com/bee-san/pyWhat/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(
    "725e07c2ae4520021805d60628b636faa1c75c9da782f0b3e5ee514edc7926d3"
)

prepare() {
    cd "$_pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

