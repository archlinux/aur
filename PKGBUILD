# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>

_name=homeassistant-cli
pkgname=python-homeassistant-cli
pkgver=0.4.4
pkgrel=1
pkgdesc='Command-line tool for Home Assistant'
arch=('any')
url=https://github.com/home-assistant/home-assistant-cli
license=('Apache')
depends=('python' 'python-requests' 'python-yaml' 'python-netdisco' 'python-click' 'python-click-log' 'python-tabulate' 'python-jsonpath-rw' 'python-jinja' 'python-dateparser' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/h/homeassistant-cli/$_name-$pkgver.tar.gz")
sha512sums=("b8a9d8ea6f70dbe2a39e27d3284dc6ededb6e3be44f7de66c52ebe1195c95fda175b80df39223d0313462d31969bf7fc22cd159381fb524b2c3d8e3705b7f072")

build() {
  cd $_name-$pkgver
  echo "Patching pyyaml to use 3.13 stable instead of 4.2b1…"
  sed -i 's/pyyaml>=4.2b1/pyyaml>=3.13/' setup.py
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
