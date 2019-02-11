# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>

_name=homeassistant-cli
pkgname=python-homeassistant-cli
pkgver=0.5.0
pkgrel=1
pkgdesc='Command-line tool for Home Assistant'
arch=('any')
url=https://github.com/home-assistant/home-assistant-cli
license=('Apache')
depends=('python' 'python-requests' 'python-netdisco' 'python-click' 'python-click-log' 'python-tabulate' 'python-jsonpath-rw' 'python-jinja' 'python-dateparser' 'python-regex' 'python-ruamel-yaml' 'python-aiohttp' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/h/homeassistant-cli/$_name-$pkgver.tar.gz")
sha512sums=("9d07d0e3a7a0fae9d5d7431b18207c2ec6615bf03c6b8c8a600a0d07618ae55cebbbd49456fe702a1300a8327f0a02ee57b528fab60ec4a997f2fb5feb755526")

build() {
  cd $_name-$pkgver
  sed -i 's/regex==2019.01.24/regex==2019.02.06/' setup.py
  sed -i 's/ruamel.yaml==0.15.85/ruamel.yaml==0.15.87/' setup.py
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
