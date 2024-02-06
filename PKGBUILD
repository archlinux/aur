# Maintainer: Jamie Paul (elitedev) <elitedevx@gmail.com>
pkgname=rivalcfg-git
_pkgname=${pkgname%-git}
pkgver=4.11.0
pkgrel=1
pkgdesc='CLI tool and Python library to configure SteelSeries gaming mice'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
depends=('python' 'hidapi' 'python-hidapi' 'python-setuptools')
makedepends=('git')
conflicts=('rivalcfg')
provides=('rivalcfg')
source=('git+https://github.com/flozz/rivalcfg')
sha256sums=('SKIP')
install=install

pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir"/$_pkgname
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
