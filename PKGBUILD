# Maintainer: Joaquim Monteiro <joaquim dot monteiro at protonmail dot com>

pkgname=python-aiohttp-socks-git
pkgver=v0.8.4.r0.gadb9bb0
pkgrel=2
pkgdesc="Proxy connector for aiohttp. Supports SOCKS4(a), SOCKS5, HTTP (tunneling) as well as proxy chains. (Git version)"
arch=(any)
url="https://github.com/romis2012/aiohttp-socks"
license=("Apache-2.0")

depends=("python" "python-aiohttp" "python-python-socks")
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-wheel")
provides=("python-aiohttp-socks")
conflicts=("python-aiohttp-socks")

source=("git+https://github.com/romis2012/aiohttp-socks.git")
sha512sums=("SKIP")

pkgver() {
    cd "aiohttp-socks"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "aiohttp-socks"
    [[ -d dist/ ]] && rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "aiohttp-socks"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
