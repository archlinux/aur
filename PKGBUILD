# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_name=snowmachine
pkgname=${_name}-git
pkgver=r84.e5934aa
pkgrel=1
pkgdesc="A python script that allows your terminal to snow"
arch=("any")
url="https://github.com/sontek/snowmachine"
license=("BSD-3-Clause")
depends=("python" "python-click" "python-colorama")
makedepends=("git" "python-hatchling" "python-build" "python-installer" "python-wheel")
provides=("$_name")
conflicts=("$_name")
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    git -C "${srcdir}/${_name}" clean -fdx
}

build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 0644 LICENSE.txt $pkgdir/usr/share/licenses/${_name}/LICENSE.txt
}
