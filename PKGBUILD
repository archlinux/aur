# Maintainer: noprobelm@protonmail.com
pkgname=tempy
pkgver=1.4.0.r192.22db47e
pkgrel=1
pkgdesc="Render visually pleasing weather reports as rich text to your terminal"
arch=(any)
url="https://github.com/noprobelm/tempy.git"
license=('MIT')
groups=()
depends=(python-rich python-requests)
makedepends=(git python-setuptools python-build python-installer python-wheel python-poetry-core)
optdepends=()
provides=(tempy)
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
    printf "1.4.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
