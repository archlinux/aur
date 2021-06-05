# Maintainer: Anton Hvornum <anton@hvornum.se>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: demostanis worlds <demostanis@protonmail.com>

pkgname=archinstall-git
pkgver='r2239.a4033a7'
pkgrel=1
pkgdesc="Just another guided/automated Arch Linux installer with a twist"
arch=('any')
url="https://github.com/archlinux/archinstall"
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
provides=('python-archinstall')
conflicts=('python-archinstall')
source=('git+https://github.com/archlinux/archinstall.git')
md5sums=('SKIP')

build() {
        cd "$srcdir/archinstall"
        python setup.py build
        make man -C docs
}

package() {
        cd "$srcdir/archinstall"
        python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
        install -vDm 644 docs/_build/man/archinstall.1 -t "${pkgdir}/usr/share/man/man1/"
}
