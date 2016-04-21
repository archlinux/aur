# Maintainer: Quey-Liang Kao<s101062801@m101.nthu.edu.tw>
# Contributor: Eduardo Leggiero <https://www.leggiero.uk/>
# Contributor: Kai Korla <balticer@balticer.de>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>
# Contributor: Ernie Brodeur <ebrodeur@ujami.net>

pkgname=gitflow-avh-git
pkgver=1.9.1.r15.g5bcfed9
pkgrel=1
pkgdesc="A collection of git extetions for Vincent Driessen's branching model."
arch=('any')
url='https://github.com/petervanderdoes/gitflow-avh'
license=('BSD')
depends=('git')
source=("$pkgname::git://github.com/petervanderdoes/gitflow-avh.git")
md5sums=('SKIP')

prepare() {
  cd $srcdir/$pkgname
  git submodule init
  git submodule update
}

package() {
  cd $srcdir/$pkgname
  make install prefix=$pkgdir/usr
}

pkgver() {
    cd $srcdir/$pkgname
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
