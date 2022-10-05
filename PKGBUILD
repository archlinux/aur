# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=itango
pkgver=0.1.9
pkgrel=1
pkgdesc="An interactive Tango client."
groups=('tango-controls')
arch=('x86_64' 'armv7h')
url="https://github.com/tango-controls/itango"
license=('GPL3')
depends=('python-pytango>=9.2' 'ipython>=1.0' 'python-qtconsole')
conflicts=('itango-git')
source=("https://gitlab.com/tango-controls/${pkgname}/-/archive/${pkgver}/itango-${pkgver}.tar.gz"
        "setup.patch")
sha256sums=('33e890fcf5355ebd9d7c1bfa3666e13b8846744e9d55125bda8f2a1650595c03'
            'b66fd41e639afc1f215ca8c684ea73e2a393f27a0887bfea00ed15f9ef3c9e7f')



prepare() {
  patch "$pkgname-$pkgver"/setup.py setup.patch
  rm -rf "$pkgname-$pkgver"/pyproject.toml
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root=$pkgdir/
  ln -s /usr/bin/itango3 $pkgdir/usr/bin/itango
  ln -s /usr/bin/itango3-qt $pkgdir/usr/bin/itango-qt
}
