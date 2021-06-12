# Maintainer: Kevin Andriessens <kevin@kelaun.be>
# Contributor: layday <layday@protonmail.com>
pkgname=instawow
pkgver=1.25.0
pkgrel=1
pkgdesc='Package manager for World of Warcraft'
arch=('x86_64')
url='https://github.com/layday/instawow'
license=('GPL3')
depends=('python>=3.7.0'
         'python-aiohttp>=3.7.4'
         'python-alembic>=1.4.3'
         'python-click>=7.1.0'
         'python-jellyfish>=0.8.2'
         'python-jinja>=2.11.0'
         'python-loguru'
         'python-pluggy>=0.13.0'
         'python-prompt_toolkit>=3.0.15'
         'python-pydantic>=1.8.2'
         'python-questionary>=1.8.0'
         'python-sqlalchemy>=1.3.19'
         'python-typing_extensions>=3.10.0.0'
         'python-yarl>=1.4.0')
makedepends=('tar' 'python-setuptools' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-aresponses')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f044dd309fbe2dd0489c3729b50bf7ba06b5c9db1863a374c7dcd24b710b14ad')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    PYTHONPATH="$PWD/build/lib" pytest --ignore tests/test_cli.py
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
