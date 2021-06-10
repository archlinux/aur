# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=python-pywhat
_pkgname=pyWhat
pkgver=1.2.0
pkgrel=1
pkgdesc="Identify emails, IP addresses and more"
arch=('any')
depends=(
    'python'
    'python-click'
    'python-langdetect'
    'python-name-that-hash' #aur
    'python-rich'
)
makedepends=("python-setuptools" "python-dephell")
url="https://github.com/bee-san/pyWhat"
license=('GPL-3.0')
source=("$pkgname.tar.gz::https://github.com/bee-san/pyWhat/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(
    "64909fd3af97d914fb41732bc635487c483a4d8bcea2a1dc49f35b1f5b9b776c"
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

