# Maintainer: Daniel Moch <daniel@danielmoch.com>
_name=nncli
pkgname=nncli-git
pkgver=v0.1.1.r13.ga666640
pkgrel=1
pkgdesc="NextCloud Notes Command Line Interface"
arch=('any')
url="https://github.com/djmoch/${_name}"
license=('MIT')
depends=('python-urwid' 'python-requests')
makedepends=('python-setuptools' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_name}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=PKGBUILD ts=2 sw=2 et
