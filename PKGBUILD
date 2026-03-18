# Maintainer: exceptionptr <https://github.com/exceptionptr>
pkgname=tsm-app
pkgver=1.0.0
pkgrel=1
pkgdesc="TradeSkillMaster Desktop App for Linux — auction data downloader for WoW under Wine/Lutris/Steam"
arch=('x86_64')
url="https://github.com/exceptionptr/tsm-app-linux"
license=('MIT')
depends=(
    'python>=3.11'
    'pyside6'
    'python-aiohttp'
    'python-pydantic'
    'python-aiosqlite'
    'python-keyring'
    'python-structlog'
    'python-tomli-w'
    'python-yaml'
    'python-apscheduler'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-hatch-vcs'
    'git'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('becab77c07c70eaf3d21f44654c0b7c3f5bc8974d3383c29544e68932cc9edd1')

build() {
    cd "$srcdir/tsm-app-linux-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/tsm-app-linux-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 packaging/tsm-app.desktop \
        "$pkgdir/usr/share/applications/tsm-app.desktop"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
