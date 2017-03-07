# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=plover-git
pkgdesc="Free and open source real-time stenography engine."
pkgver=4.0.0.dev0.144.gded92d7
pkgrel=1
arch=('any')
license=('GPL2')
depends=(
  'python'
  'python-appdirs'
  'python-dbus'
  'python-hidapi'
  'python-pyqt5'
  'python-pyserial'
  'python-setuptools'
  'python-six'
  'python-xlib'
  'wmctrl'
)
makedepends=(
  'git'
  'python-babel'
  'python-mock'
  'python-pytest'
  'python-setuptools-scm'
)
provides=('plover')
conflicts=('plover-git')
url="http://www.openstenoproject.org/plover/"
source=($pkgname::git+https://github.com/openstenoproject/plover.git)
sha1sums=(SKIP)

pkgver() {
  cd "$pkgname"
  python setup.py patch_version | sed -n '/^patching version to /{s///;s/+/./;p;Q0};${Q1}'
}

prepare() {
  cd "$pkgname"
}

build() {
  cd "$pkgname"
  PYTHONPATH="$(echo -n .eggs/pyqt_distutils-*.egg)" python setup.py build
}

check() {
  cd "$pkgname"
  python setup.py test
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir"
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
