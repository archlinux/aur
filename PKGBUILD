# Maintainer: Kevin Andriessens <kevin@kelaun.be>
# Contributor: layday <layday@protonmail.com>
pkgname='instawow'
pkgver='1.19.1'
pkgrel=3
pkgdesc="Package manager for World of Warcraft"
arch=('x86_64')
url="https://github.com/layday/instawow"
license=('GPL3')
depends=('python>=3.7.0' 'python-aiohttp>=3.6.0' 'python-aiohttp<3.7.0' 'python-alembic>=1.4.3' 'python-alembic<1.5.0' 'python-click>=7.1.0' 'python-click<8.0.0' 'python-jellyfish>=0.8.2' 'python-jellyfish<0.9.0' 'python-jinja>=2.11.0' 'python-jinja<3.0.0' 'python-loguru<1.0.0' 'python-prompt_toolkit>=3.0.3' 'python-prompt_toolkit<4.0.0' 'python-pydantic>=1.7.0' 'python-pydantic<1.8.0' 'python-questionary>=1.8.0' 'python-questionary<2.0.0' 'python-sqlalchemy>=1.3.19' 'python-sqlalchemy<1.4.0' 'python-typing_extensions>=3.7.4.3' 'python-typing_extensions<4.0.0' 'python-yarl>=1.4.0' 'python-yarl<2.0.0')
conflicts=('python-aiohttp=3.6.3' 'python-yarl-gns3' 'python-aiohttp-gns3' 'python-prompt_toolkit-gns3')
makedepends=('tar' 'python-setuptools' 'python-setuptools-scm' 'python-toml')
optdepends=('python-aiohttp_rpc: server support')
checkdepends=('python-pytest>=6.0.1' 'python-pytest<7.0.0' 'python-pytest-asyncio>=0.14.0' 'python-pytest-asyncio<1.0.0' 'python-aresponses>=2.0.0' 'python-aresponses<3.0.0')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fb7ca5b533f4af58578e28fecfce77406e2c23e8f4825cd69b9c62c44fcea48c')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	PYTHONPATH="$PWD/build/lib" pytest --ignore tests/test_json_rpc_api.py --ignore tests/test_cli.py
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
