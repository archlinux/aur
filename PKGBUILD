# Maintainer: angelsl
pkgbase=projectctr-git
pkgname=('projectctr-ctrtool-git' 'projectctr-makerom-git')
pkgver=1509277700.bbd9a90
pkgrel=1
pkgdesc="Project CTR tools"
arch=('i686' 'x86_64')
url="https://github.com/profi200/Project_CTR"
license=('MIT')
sha256sums=('SKIP' '2b9f4fed8e35d271b06a1901668210f7f622e1e769f229711d9370b2d501fed2')

_gitroot='https://github.com/profi200/Project_CTR.git'
_gitname='pctr'

source=("${_gitname}::git+${_gitroot}" '01-fix-ctrtool-cxxflags.patch')

pkgver() {
    cd "$srcdir/$_gitname"
    git log --pretty=format:"%ad.%h" --date=format:"%s" -1
}

prepare() {
    cd "$srcdir/$_gitname"
    patch -p1 < "$srcdir/01-fix-ctrtool-cxxflags.patch"
}

build() {
    cd "$srcdir/$_gitname/ctrtool"
    make
    cd "$srcdir/$_gitname/makerom"
    make
}

package_projectctr-ctrtool-git() {
    install -D "$srcdir/$_gitname/ctrtool/ctrtool" "$pkgdir/usr/bin/ctrtool"
}

package_projectctr-makerom-git() {
    install -D "$srcdir/$_gitname/makerom/makerom" "$pkgdir/usr/bin/makerom"
}
