# Maintainer: kirarahoshiiii
pkgname=fpvtop
pkgver=0.2.0
pkgrel=1
pkgdesc="btop-style live terminal monitor for Betaflight flight controllers over MSP"
arch=('any')
url="https://github.com/kirarahoshiiii/fpvtop"
license=('MIT')
depends=('python' 'python-pyserial')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6eac328a6ee944fadc39ed6f80881b911da3acd21a2f73e451a8d725fd78d7d2')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 packaging/completions/fpvtop.bash "$pkgdir/usr/share/bash-completion/completions/fpvtop"
    install -Dm644 packaging/completions/_fpvtop "$pkgdir/usr/share/zsh/site-functions/_fpvtop"
    install -Dm644 packaging/completions/fpvtop.fish "$pkgdir/usr/share/fish/vendor_completions.d/fpvtop.fish"
}
