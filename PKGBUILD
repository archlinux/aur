# Maintainer: Escher Moore <aur@eschermoore.com>

pkgname=dtbell-git
pkgver=v1.1.1.r3.ge85796b
pkgrel=1
pkgdesc="A highly configurable Linux-based desktop notifier for RSS/Atom feeds."
arch=("x86_64")
url="https://github.com/eschermoore/ditchthebell"
license=("GPL3")
depends=(
    "python>=3.7"
    "python-aiohttp"
    "python-feedparser"
    "python-gobject"
    "python-pydbus"
    "python-dateutil"
    "python-pytz"
)
makedepends=(
    "git"
    "python-build"
    "python-hatchling"
    "python-installer"
    "python-wheel"
)
source=("${pkgname}::git+https://github.com/eschermoore/ditchthebell")
md5sums=("SKIP")

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
