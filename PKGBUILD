# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>

_name=homeassistant-cli
pkgname=python-homeassistant-cli
pkgver=0.6.0
pkgrel=1
pkgdesc='Command-line tool for Home Assistant'
arch=('any')
url=https://github.com/home-assistant/home-assistant-cli
license=('Apache')
depends=('python' 'python-requests' 'python-netdisco' 'python-click' 'python-click-log' 'python-tabulate' 'python-jsonpath-rw' 'python-jinja' 'python-dateparser' 'python-regex' 'python-ruamel-yaml' 'python-aiohttp' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/h/homeassistant-cli/$_name-$pkgver.tar.gz")
sha512sums=("0d41bbde95b3e52182f5351bb9de088550251630d5688453527f175cd78e553d063d6af463de102c157fbff98c82caffa9f19921cfaa3362ed19f940d460f901")

build() {
  cd $_name-$pkgver
  sed -i 's/regex==2019.[0-9]\{2\}.[0-9]\{2\}/regex>=2019.02.18/' setup.py
  sed -i 's/ruamel.yaml==0.[0-9]\{2\}.[0-9]\{2\}/ruamel.yaml>=0.15.88/' setup.py
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
