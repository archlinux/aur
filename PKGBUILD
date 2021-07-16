# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=python-pywhat
_pkgname=pyWhat
pkgver=3.2.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/bee-san/pyWhat/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(
    "f742745a30357f9a7f8c0117f4ec3c8808016a3dfbdc8568600a0cacd3e3acc2"
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

