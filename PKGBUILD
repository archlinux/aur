# Maintainer: nVjhNFGQWoBQEthk

_pkgname=epy-ereader
pkgname=$_pkgname-mcepl
_pkgname_short=epy
pkgver=2025.5.27
pkgrel=1
pkgdesc="fork of wustho/epy with continued development"
url="https://git.sr.ht/~mcepl/epy"
license=(GPL-3.0-only)
arch=(x86_64)
depends=(python python-imghdr)
makedepends=(git python-build python-installer python-poetry python-wheel python-setuptools)
provides=(epy)
conflicts=($_pkgname $_pkgname-git $pkgname-git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(c338a6bbc251e46648c2ce26a895004c04ed1163df793ea74d7a0579fee51c70)

build() {
    cd "$_pkgname_short-v$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$_pkgname_short-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
