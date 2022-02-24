# -*- mode: sh; -*-
# Maintainer: Maor Kadosh <qoev@protonmail.com>

pkgname=gitless-git
pkgver=3.ge32e2cc
pkgrel=1
pkgdesc="A scientifically proven easier-to-use git interface (git upstream)"
arch=(x86_64)
url="https://gitless.com/"
license=('MIT')
depends=(python-pygit2 python-setuptools)
makedepends=(git)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=($pkgname::git://github.com/goldstar611/gitless.git)
md5sums=('SKIP')  # since the sources aren't static

pkgver() {
    cd "$srcdir/${pkgname%}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

    printf "%s" "$(git describe --long | cut -d'-' -f2,3 | sed 's/-/./')"
}

package() {
    cd "$srcdir/${pkgname%}"
    python setup.py install --root=${pkgdir} --optimize=2

    # copy custom license:
    # https://wiki.archlinux.org/index.php/PKGBUILD#license
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
