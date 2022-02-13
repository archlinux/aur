# Maintainer: Miten <admin@m1ten.me>
# Maintainer: Anton Hvornum <anton@hvornum.se>

_name=archinstall
pkgname=archinstall-git
pkgver=2.4.0.dev0
pkgrel=1
pkgdesc="Just another guided/automated Arch Linux installer with a twist"
arch=('any')
url="https://github.com/archlinux/$_name"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
provides=('python-archinstall')
conflicts=('python-archinstall')
replaces=('python-archinstall')
source=("git+https://github.com/archlinux/$_name.git")
sha256sums=('SKIP')


build() {
  cd "$_name"

  python setup.py build
  make man -C docs
}

package() {
  cd "$_name"

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -vDm 644 docs/_build/man/archinstall.1 -t "${pkgdir}/usr/share/man/man1/"
}
