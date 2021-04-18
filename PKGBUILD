# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: bartus
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=pyalpm-next-git
pkgver=0.9.2.r6.g325bbe9
pkgrel=2
pkgdesc='Python 3 bindings for libalpm (Git version, compatible with pacman-git)'
arch=(x86_64)
url=https://gitlab.archlinux.org/archlinux/pyalpm
license=(GPL)
depends=(python pacman-git)
makedepends=(git python-setuptools python-pytest)
provides=("${pkgname%-next-git}=$pkgver")
conflicts=("${pkgname%-next-git}")
source=(git+"${url}".git#branch=next)
md5sums=('SKIP')

pkgver() {
    git -C ${pkgname%-next-git} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname%-next-git}
    python setup.py build
}

check() {
    cd ${pkgname%-next-git}
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.9" pytest
}

package() {
    cd ${pkgname%-next-git}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
