# Maintainer: Juan Boullosa <jmboullosa@zentus.io>
pkgname=wxextract
pkgver=0.7.1
pkgrel=1
pkgdesc="Extract WeChat 4.x conversations on Linux into compact LLM-ready text + interactive HTML report"
arch=('any')
url="https://github.com/boujuan/extract-wechat-messages-linux"
license=('MIT')
depends=(
    'python>=3.12'
    'python-pycryptodome'
    'python-zstandard'
    'python-tiktoken'
    'python-rich'
    'python-rich-argparse'
)
optdepends=(
    'sqlcipher: faster + WAL-correct decrypt (falls back to pure-Python AES otherwise)'
    'wechat-bin: the AUR build of WeChat 4.x this tool targets (only needed to extract live data)'
    'rsync: faster snapshot copy (usually already installed)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/boujuan/extract-wechat-messages-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d15143739ae5d5c71bffb477fa40c434a207bf307151b294db04ffd55d91d87f')

build() {
    cd "extract-wechat-messages-linux-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "extract-wechat-messages-linux-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md      "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md   "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 NOTICE.md      "$pkgdir/usr/share/doc/$pkgname/NOTICE.md"
}
