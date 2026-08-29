# Maintainer: user14923929
pkgname=smart-router
pkgver=0.1.0
pkgrel=1
pkgdesc="Turn a Linux box into a router with rule-based (non-AI) smart auto-recovery"
arch=('any')
url="https://github.com/user14923929/smart-router"
license=('GPL3')
depends=('python' 'nftables' 'iproute2' 'dnsmasq')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
backup=('etc/smart-router/smart-router.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3f0a15e0ba81b66578a131c0a363626aad150bfa1defa917ba5c7423ebd9fc5')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 config/smart-router.conf \
        "$pkgdir/etc/smart-router/smart-router.conf"
    install -Dm644 systemd/smart-router.service \
        "$pkgdir/usr/lib/systemd/system/smart-router.service"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
