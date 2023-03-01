# Maintainer: noprobelm@protonmail.com
pkgname=tempy-git
pkgver=1.0.r59.5bd7a5b
pkgrel=1
pkgdesc="Render visually pleasing weather reports as rich text to your terminal"
arch=(any)
url="https://github.com/noprobelm/tempy.git"
license=('MIT')
groups=()
depends=(python-rich python-requests)
makedepends=(git python-setuptools python-build python-installer python-wheel)
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
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd tempy-git
    python -m build --wheel --no-isolation
}

package() {
    cd tempy-git
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
