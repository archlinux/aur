# Maintainer: nVjhNFGQWoBQEthk

_pkgname=epy-ereader
pkgname=$_pkgname-mcepl
_pkgname_short=epy
pkgver=2025.5.27
pkgrel=1
pkgdesc="fork of wustho/epy with continued development"
url="https://codefloe.com/mcepl/epy"
license=(GPL-3.0-only)
arch=(x86_64)
depends=(python python-imghdr)
makedepends=(git python-build python-installer python-poetry python-wheel python-setuptools)
provides=(epy)
conflicts=($_pkgname $_pkgname-git $pkgname-git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(1c8779dafe6ba6ab38d1b179c8aa935b5cd9c34758b684946862c55c156e2d57)

build() {
    cd "$_pkgname_short"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$_pkgname_short"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
