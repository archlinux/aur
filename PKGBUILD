# Maintainer: Penelope Belle <penny belle 98 at gmail dot com>
pkgname=pbfetch-git
pkgver=r129.7b912c9
pkgrel=1
pkgdesc="An unbelievably customizable hardware/software fetch"
arch=('x86_64' 'aarch64')
url="https://github.com/pennybelle/pbfetch"
license=('Apache-2.0')
depends=("python-psutil")
makedepends=(python-build python-installer python-wheel python-hatchling git)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/pennybelle/pbfetch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-git}"
    # install -Dm755 "$srcdir/${pkgname%-git}/src/${pkgname%-git}/config/config.txt" "$pkgdir/usr/share/pbfetch/config/config.txt"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 pbfetch "$pkgdir/usr/bin/pbfetch"
}