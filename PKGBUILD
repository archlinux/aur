# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=ShazamIO
pkgname=python-shazamio
pkgver=0.4.0.1
pkgrel=1
pkgdesc='Is a asynchronous framework from reverse engineered Shazam API written in Python 3.8+ with asyncio and aiohttp.'
arch=('any')
url='https://github.com/dotX12/ShazamIO'
license=('MIT')
depends=(
    'python>=3.8'
    'python-aiofiles>=22.1.0'
    'python-aiohttp>=3.8.3'
    'python-anyio>=3.6.2'
    'python-dataclass-factory>=2.16'
    'python-numpy>=1.24.0'
    'python-pydub>=0.25.1'
)
makedepends=(
    python-build
    python-installer
    'python-poetry>=1.5.0'
    'python-poetry<2.0.0'
    'python-virtualenv>=20.22.0'
    'python-wheel>=0.36'
    
    # needed by poetry
    'python-cachecontrol=0.12.9'
    'python-lockfile' # for cachecontrol[filecache]
    'python-keyring>=23.9.0'
    'python-keyring<24.0'
    'python-poetry-plugin-export>=1.4.0'
    'python-poetry-plugin-export<2.0.0'
)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('2c681fd02a92558a66e1ef4320b839b40ba659006f202234342d5bbaf9e1fe454c82f17e6c868a18546e2c536ca51c58e0227e20aaae15d057e5bfe99460e3e6')

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
