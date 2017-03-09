# Maintainer: angelsl
pkgbase=projectctr-git
pkgname=('projectctr-ctrtool-git' 'projectctr-makerom-git')
pkgver=1487357388.7dcc166
pkgrel=1
pkgdesc="Project CTR tools"
arch=('i686' 'x86_64')
url="https://github.com/profi200/Project_CTR"
license=('MIT')
sha256sums=('SKIP' 'be54e068b07532b7b0972a93d4a61da99fc947063664574ff93df8267c49da35')

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
