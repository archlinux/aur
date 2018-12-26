# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prewikka
pkgver=5.0.2
pkgrel=1
pkgdesc="Graphical front-end analysis console for the Prelude Framework"
arch=('i686' 'x86_64')
url="https://www.prelude-siem.org"
license=('GPLv2')
depends=('python3' 'python-mako' 'python-yaml' 'python-werkzeug' 'python-babel' 'python-dateutil' 'python-pytz' 'xorg-fonts-type1' 'libprelude' 'libpreludedb' 'python-lark' 'python-croniter' 'python-voluptuous')
makedepends=('python-setuptools' 'python-lesscpy' 'gettext')
source=("https://www.prelude-siem.org/pkg/src/5.0.0/$pkgname-$pkgver.tar.gz"
        "prewikka-5.0.2-Python3-compatibility-fixes.patch")
backup=('etc/prewikka/prewikka.conf')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python3 setup.py install --root="$pkgdir"
  rm -rf $pkgdir/var/run
}

prepare() {
  patch -p0 <prewikka-5.0.2-Python3-compatibility-fixes.patch
}

md5sums=('e4adbd24f21481aae56c386a2c7149cf' '3c730964d3a9979595bf43602fe9d714')
