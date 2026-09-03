# Maintainer: Radon Rosborough <radon@radian.codes>

pkgname=signal-export
pkgver=3.9.3
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
    'python-markdown>=3.8.1'
    'python-markdown<4.0'
    'python-typer>=0.16.0'
    'python-pycryptodome>=3.20'
    'python-pycryptodome<4.0'
    'python-sqlcipher3>=0.5.4'
    'python-filetype>=1.2.0'
)
makedepends=(python-build python-installer python-pdm-backend)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('decb59e547cc1f6fbc23f2577e63c820f501cea240af58384c7add1acce5ce2c')

check() {
    cd $pkgname-$pkgver
    pytest
}

build() {
    cd $pkgname-$pkgver
    PDM_BUILD_SCM_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
