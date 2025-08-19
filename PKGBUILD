# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_name=amazing-qr
pkgname=${_name}-git
pkgver=r93.a773916
pkgrel=1
pkgdesc="QR code generator written in Python"
arch=("any")
url="https://github.com/x-hw/amazing-qr"
license=("GPL-3.0-only")
depends=("python" "python-imageio>=1.5" "python-numpy>=1.11.1" "python-pillow>=3.3.1")
makedepends=("git" "python-setuptools" "python-build" "python-installer" "python-wheel")
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
    install -Dm 0644 LICENSE.md $pkgdir/usr/share/licenses/${_name}/LICENSE.md
}
