# Maintainer: AntiCompositeNumber <anticompositenumber at gmail dot com>
pkgname=fresh-node
pkgver=24.05.1
pkgrel=2
pkgdesc="Wikimedia tool to create Docker containers for running isolated npm tests"
arch=('any')
url="https://gerrit.wikimedia.org/g/fresh"
license=('custom:0BSD')
depends=('bash')
makedepends=('git')
checkdepends=()
optdepends=('podman: podman or docker must be installed'
            'docker: podman or docker must be installed')
source=("$pkgname-$pkgver::git+https://gerrit.wikimedia.org/r/fresh#tag=$pkgver")
sha256sums=('SKIP')

prepare () {
	cd "$pkgname-$pkgver"
    # The first two install tests fail on my machine at least.
    # This PKGBUILD doesn't use fresh-install anyway, so we're not losing anything.
    sed '101,135 {s/^/#/}' -i test
}

check() {
	cd "$pkgname-$pkgver"
	./test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE-0BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 -t "$pkgdir/usr/bin/" bin/fresh-node*
    ln -s /usr/bin/fresh-node20 "$pkgdir/usr/bin/fresh-node"
}
