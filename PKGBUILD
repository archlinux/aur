# Maintainer: <szymon_jozef@proton.me>
_pkgname="zutui"
pkgname="$_pkgname-git"
pkgver=1.0.0
pkgrel=1
pkgdesc="TUI for accessing edziekanat of ZUT university"
arch=("any")
url="https://github.com/shv187/zutui"
license=("MIT")
depends=("python" "python-keyring" "python-textual")
makedepends=("git" "python-build" "python-installer" "python-wheel" "python-setuptools")
provides=("zutui")
conflicts=("zutui")
source=("$_pkgname::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
