# Maintainer: Kirara <kiraralarpsec@gmail.com>
pkgname=fpvtester
pkgver=2.0.0
pkgrel=1
pkgdesc="Automated Betaflight flight controller QC, inspection and configuration over MSP"
arch=('any')
url="https://github.com/kirarahoshiiii/fpv-tester"
license=('MIT')
depends=('python' 'python-pyserial')
optdepends=('tk: graphical interface via fpvtester-gui')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('618756ec28bae95d827bef93333f7080cd1bb79820aae109125811cc13ff4f45')

build() {
    cd "fpv-tester-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "fpv-tester-$pkgver"
    python tests/test_parser.py
}

package() {
    cd "fpv-tester-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 completions/fpvtester.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/fpvtester.fish"
    install -Dm644 completions/fpvtester.bash \
        "$pkgdir/usr/share/bash-completion/completions/fpvtester"
    install -Dm644 completions/_fpvtester \
        "$pkgdir/usr/share/zsh/site-functions/_fpvtester"
}
