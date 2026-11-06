# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=python-unicode-rbnf
pkgver=2.4.1
pkgrel=1
epoch=
pkgdesc="A pure Python implementation of ICU's rule-based number format engine"
arch=('any')
url="https://github.com/rhasspy/unicode-rbnf"
license=('MIT')
groups=()
depends=(python)
makedepends=(
    git
    python-pytest
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+${url}.git#tag=v$pkgver")
noextract=()
sha256sums=('b3eba9ddec4f69109812c5f0f1fddf1b065f1eeb1c1fcf40f291546db724e625')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"

    python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"

    PYTHONPATH="$PWD:$PYTHONPATH" pytest
}

package() {
	cd "$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
