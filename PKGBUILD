# Maintainer: Maxr1998 <aur@maxr1998.de>

_name=homeassistant-cli
pkgname=python-homeassistant-cli
pkgver=0.9.4
pkgrel=1
pkgdesc='Command-line tool for Home Assistant'
arch=('any')
url=https://github.com/home-assistant-ecosystem/home-assistant-cli
license=('Apache')
depends=('python' 'python-requests' 'python-netdisco' 'python-click' 'python-click-log' 'python-tabulate' 'python-jsonpath-ng' 'python-jinja' 'python-dateparser' 'python-regex' 'python-ruamel-yaml' 'python-aiohttp' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
conflicts=('home-assistant-cli')
source=("https://files.pythonhosted.org/packages/source/h/homeassistant-cli/$_name-$pkgver.tar.gz")
sha256sums=("4e74591d6400c7b1ba93e8967d39ce00c2789523508406c6cbc8fd712ff6710e")

build() {
  cd $_name-$pkgver
  sed -i 's/regex==2019.[0-9]\{2\}.[0-9]\{2\}/regex>=2019.06.02/' setup.py
  sed -i 's/requests==[0-9].[0-9]\{2\}.[0-9]/requests>=2.22.0/' setup.py
  sed -i 's/ruamel.yaml==[0-9].[0-9]\{2\}.[0-9]\{2\}/ruamel.yaml>=0.15.97/' setup.py
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
