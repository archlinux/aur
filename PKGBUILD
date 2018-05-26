# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prewikka
pkgver=4.1.5
pkgrel=1
pkgdesc="Graphical front-end analysis console for the Prelude Framework"
arch=('i686' 'x86_64')
url="https://www.prelude-siem.org"
license=('GPLv2')
depends=('python2' 'python2-mako' 'python2-yaml' 'python2-werkzeug' 'python2-babel' 'python2-dateutil' 'python2-pytz' 'xorg-fonts-type1' 'libprelude' 'libpreludedb')
makedepends=('python2-setuptools' 'python-lesscpy' 'gettext' 'python-croniter')
source=("https://www.prelude-siem.org/pkg/src/4.1.0/$pkgname-$pkgver.tar.gz"
	"prewikka-4.1.5-fix_python.patch")
backup=('etc/prewikka/prewikka.conf')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
  rm -rf $pkgdir/var/run
}

prepare() {
  patch -p0 <prewikka-4.1.5-fix_python.patch
}

md5sums=('f58d4c3069692cdd9eb3a82ceb997a2c' '4aaccecfee709648f1e5c5e906d19053')
