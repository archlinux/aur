# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>


_name=pytango
pkgname=python-$_name
pkgver=9.4.2
_tag=v$pkgver
pkgrel=2
pkgdesc="A python binding for the Tango control system"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://pytango.readthedocs.io/en/stable/'
license=('LGPL3')
groups=('tango-controls')
depends=('tango-cpp>=9.4.0' 'boost' 'python-numpy' 'python-six'
	 'python-gevent' 'python-pytest' 'python-psutil')
makedepends=(python-setuptools python-sphinx python-sphinx_rtd_theme)

source=("$_name-$_tag.tar.gz::https://gitlab.com/tango-controls/$_name/-/archive/v$pkgver/$_name-$_tag.tar.gz" "int.patch")
sha256sums=('736d5acde077d9c3cceedd2c633d43272209f260865b7ea41748e0fed9344fdc'
            '5e0e66b6c51be2dfa9e16f3cb900df25fcc68219ca112547a820f969ce73ab69')

prepare() {
  cd "$_name-$_tag"
  patch -N -p1 --input="${srcdir}/int.patch"
}

build() {
  cd "$_name-$_tag"
  python setup.py build
}

package() {
  cd "$_name-$_tag"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
