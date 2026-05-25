# Maintainer: Radon Rosborough <radon@radian.codes>

pkgname=signal-export
pkgver=3.8.3
pkgrel=1
pkgdesc='Export your Signal chats to markdown files with attachments'
arch=('any')
url="https://github.com/carderne/$pkgname"
license=('MIT')
depends=(
    'python>=3.9'

    'python-beautifulsoup4>=4.11'
    'python-beautifulsoup4<5.0'
    'python-emoji>=2.0'
    'python-emoji<3.0'
    'python-markdown>=3.4'
    'python-markdown<4.0'
    'python-typer>=0.12.1'
    'python-pycryptodome>=3.20'
    'python-pycryptodome<4.0'
    'python-sqlcipher3>=0.5.4'
)
makedepends=(python-build python-installer python-pdm-backend)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d4af3ef49aa457a3f63d5f08d46cefc0da0723098f264eb07f4ebfe305957b95')

# No check() because upstream essentially has no tests

build() {
    cd $pkgname-$pkgver
    PDM_BUILD_SCM_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
