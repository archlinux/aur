# Maintainer: ramen <hendrik@hndrkk.sh>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Gore Liu <goreliu@126.com>

pkgname=python-lolcat
_pkgname=lolcat
pkgver=1.4
pkgrel=4
pkgdesc="Rainbows and unicorns (without Ruby! jay!)"
url="https://github.com/tehmaze/lolcat"
arch=('any')
license=('custom:beerware')
depends=('python')
makedepends=('python-setuptools')
provides=('lolcat')
conflicts=('lolcat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2e5608f541a2a5fa68811ec2e9907177cf8ad315b771b59e5873748ad2ab2c4ea1609f45a72b4c4b3c7d5383e88ac4e57be8e458a5f6a2f055faa714dd8ee5dc')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build

  sed -n 's/^#[ ]*//;3,7p;' lolcat > LICENSE
}

check() {
  cd "$_pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: set ts=2 sw=2 et:
