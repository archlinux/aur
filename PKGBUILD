# Maintainer: Penelope Belle <contact at pennybelle dot dev>
pkgname=pbfetch-git
pkgver=r355.dac032a
pkgrel=1
pkgdesc="An unbelievably customizable hardware/software fetch"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/pennybelle/pbfetch"
license=('Apache-2.0')
depends=("python-psutil" "tk")
makedepends=(python-build python-installer python-wheel python-hatchling git)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/pennybelle/pbfetch.git#branch=main")
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
    install -Dm755 bin/pbfetch "$pkgdir/usr/bin/pbfetch"
}
