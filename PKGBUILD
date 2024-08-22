# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=ShazamIO
pkgname=python-shazamio
pkgver=0.6.0
pkgrel=1
pkgdesc='Is a asynchronous framework from reverse engineered Shazam API written in Python 3.8+ with asyncio and aiohttp.'
arch=('any')
url='https://github.com/shazamio/ShazamIO'
license=('MIT')
depends=(
    'python>=3.8'
    'python-aiofiles>=23.2.1'
    'python-aiohttp>=3.8.3'
    'python-aiohttp-retry>=2.8.3'
    'python-anyio>=4.3.0'
    'python-dataclass-factory>=2.16'
    'python-numpy>=1.24.0'
    'python-pydantic>=1.10.2'
    'python-pydub>=0.25.1'
    'python-shazamio-core>=1.0.7'
)
makedepends=(
    python-build
    python-installer
    'python-poetry-core>=1.0.0'
    'python-wheel>=0.36'
    # needed by poetry
    # 'python-cachecontrol'
    # 'python-cleo>=2.1.0'
    # 'python-cleo<3.0.0'
    # 'python-lockfile' # for cachecontrol[filecache]
    # 'python-keyring>=23.9.0'
    # 'python-platformdirs>=3.9.1'
    # 'python-platformdirs<4'
    # 'python-poetry-plugin-export>=1.6.0'
    # 'python-poetry-plugin-export<2.0.0'
    # 'python-virtualenv>=20.22.0'
    # 'python-virtualenv<21.0.0'
)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('d85c8317d42a5080c2371bc12c0d4d47998ee2fa28b2fb92ffc2117488bc010c3439c7de0f05d970eb5b3f45df013d68aaf76a4f5e6edad0b1fa25f8cd1ca624')

prepare() {
    cd $_name-$pkgver
    # otherwise it's impossible to satisfy both constraints
    sed -i 's/virtualenv==20.0.33/virtualenv>=20.22.0/g' pyproject.toml
}

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
