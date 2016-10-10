# Maintainer: Felix Morgner <felix.morgner@gmail.com>

pkgname=('dscreen-git')
pkgver=0.1.1
pkgrel=2
pkgdesc="A DBus wrapper for xscreensaver"
arch=('any')
url="https://github.com/fmorgner/dscreen.git"
license=('BSD')
makedepends=('python-setuptools' 'git')
depends=('python-gobject'
         'python-dbus')
source=('dscreen-git::git+https://github.com/fmorgner/dscreen.git'
        '0001_dscreen-git_remove-requires.patch')
md5sums=('SKIP'
         '1a562230bd3ae650ef33c40658634cd8')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/0001_dscreen-git_remove-requires.patch"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --optimize=1 --root=${pkgdir}
  install -m755 -d "${pkgdir}/usr/share/licenses/dscreen/"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/dscreen/"
}
