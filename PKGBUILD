# Maintainer: noprobelm@protonmail.com
pkgname=tca
pkgver=0.1.0.r140.f8d6106
pkgrel=1
pkgdesc="Simulate cellular automaton and render it to the terminal"
arch=(any)
url="https://github.com/noprobelm/terminal-cellular-automaton.git"
license=('MIT')
groups=()
depends=(python-rich python-requests)
makedepends=(git python-setuptools python-build python-installer python-wheel python-poetry-core)
optdepends=()
provides=(tca)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname"::"git+$url")
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
    cd "$pkgname"
    printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd tca
    /usr/bin/python3 -m build --wheel --no-isolation
}

package() {
    cd tca
    python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
