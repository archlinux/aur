# Maintainer: Miten <admin@m1ten.me>
# Maintainer: Anton Hvornum <anton@hvornum.se>

_name=archinstall
pkgname=archinstall-git
pkgver='2.3.0.r2239.a4033a7'
pkgrel=1
pkgdesc="Just another guided/automated Arch Linux installer with a twist"
arch=('any')
url="https://github.com/archlinux/$_name"
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
provides=("python-$_name")
conflicts=("python-$_name")
source=("git+https://github.com/archlinux/$_name.git")
sha256sums=('SKIP')

build() {
        cd "$srcdir/$_name"
        python setup.py build
        make man -C docs
}

package() {
        cd "$srcdir/$_name"
        python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
        install -vDm 644 docs/_build/man/$_name.1 -t "${pkgdir}/usr/share/man/man1/"
}
