# Maintainer: kirarahoshiiii
pkgname=fpvtop
pkgver=0.3.0
pkgrel=1
pkgdesc="btop-style live terminal monitor for Betaflight flight controllers over MSP"
arch=('any')
url="https://github.com/kirarahoshiiii/fpvtop"
license=('MIT')
depends=('python' 'python-pyserial')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1dadcc35616b56ac40129db4134e5fbfea55b3cdc5c2e83991142341d4c9350e')

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
