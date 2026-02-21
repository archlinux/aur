# Maintainer: Radon Rosborough <radon@radian.codes>

pkgname=signal-export
pkgver=3.8.2
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
sha256sums=('401f815c46c1f90e6ce24840a105d015439f7cbfd293cb434fd1c8afb0e51ea0')

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
