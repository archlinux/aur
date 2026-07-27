pkgname=tarvalon-scraper
pkgver=0.2.0
pkgrel=1
pkgdesc="Tar Valon Library scraper"
arch=('any')
url="https://github.com/code7wormer/tar_valon_scraper"
license=('MIT')

depends=(
    'python'
    'python-requests'
    'python-beautifulsoup4'
    'python-rich'
    'python-ebooklib'
    'python-markdown'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)

source=("https://files.pythonhosted.org/packages/b7/d3/a4c382e41b885cf11a323c712279e9e36680f0505c4eb585567ed38d3cda/tarvalon_scraper-${pkgver}.tar.gz")

sha256sums=('6a6c1722cadf7d04c2d55c7c0f857204ab388fc4c877305105143cf24588d2e4')


build() {
    cd "$srcdir/tarvalon_scraper-$pkgver"

    python -m build --wheel --no-isolation
}


package() {
    cd "$srcdir/tarvalon_scraper-$pkgver"

    python -m installer \
        --destdir="$pkgdir" \
        dist/*.whl

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
