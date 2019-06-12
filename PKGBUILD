# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>

_name=homeassistant-cli
pkgname=python-homeassistant-cli
pkgver=0.7.0
pkgrel=1
pkgdesc='Command-line tool for Home Assistant'
arch=('any')
url=https://github.com/home-assistant/home-assistant-cli
license=('Apache')
depends=('python' 'python-requests' 'python-netdisco' 'python-click' 'python-click-log' 'python-tabulate' 'python-jsonpath-rw' 'python-jinja' 'python-dateparser' 'python-regex' 'python-ruamel-yaml' 'python-aiohttp' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/h/homeassistant-cli/$_name-$pkgver.tar.gz")
sha256sums=("a38d4669201ac2afa71b6578a220bf4d6d59131263b278d51ebd1479677f6baf")

build() {
  cd $_name-$pkgver
  sed -i 's/regex==2019.[0-9]\{2\}.[0-9]\{2\}/regex>=2019.06.02/' setup.py
  sed -i 's/requests==[0-9].[0-9]\{2\}.[0-9]/requests>=2.22.0/' setup.py
  sed -i 's/ruamel.yaml==[0-9].[0-9]\{2\}.[0-9]\{2\}/ruamel.yaml>=0.15.97/' setup.py
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
