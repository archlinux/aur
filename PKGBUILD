# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-aiohttp-proxy-git
pkgver=v0.1.1.r6.g8810ab6
pkgrel=2
pkgdesc="SOCKS proxy connector for aiohttp. HTTP, HTTPS, SOCKS4(a) and SOCKS5(h) proxies are supported. (Git version)"
arch=(any)
url="https://github.com/Skactor/aiohttp-proxy"
license=("Apache-2.0")

depends=("python" "python-aiohttp")
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-wheel")
provides=("python-aiohttp-proxy")
conflicts=("python-aiohttp-proxy")

source=("git+https://github.com/Skactor/aiohttp-proxy.git")
sha512sums=("SKIP")

pkgver() {
    cd "aiohttp-proxy"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "aiohttp-proxy"
    [[ -d dist/ ]] && rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "aiohttp-proxy"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
