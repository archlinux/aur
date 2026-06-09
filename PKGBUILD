# Maintainer: Juan Boullosa <jmboullosa@zentus.io>
pkgname=wxextract
pkgver=0.8.1
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
    'python-requests: Instagram live --thread extraction (private API)'
    'python-browser-cookie3: Instagram live --thread extraction (reads the browser session cookie; pip install if not in AUR)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/boujuan/extract-wechat-messages-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3130f036dfc62b6ba7cb065e1c043646f8d1e9b6c1118bbf15c94d109e0f7bce')

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
