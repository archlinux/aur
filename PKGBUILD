# Maintainer: angelsl
pkgname=bannertool-git
pkgver=1456909511.c518996
pkgrel=1
pkgdesc=" A tool for creating 3DS banners. "
arch=('i686' 'x86_64')
url="https://github.com/Steveice10/bannertool"
license=('MIT')
sha256sums=('SKIP' 'SKIP')

_gitroot='https://github.com/Steveice10/bannertool.git'
_gitname='bannertool'

source=("${_gitname}::git+${_gitroot}"
        "buildtools::git+https://github.com/Steveice10/buildtools")

pkgver() {
    cd "$srcdir/$_gitname"
    git log --pretty=format:"%ad.%h" --date=format:"%s" -1
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule init
    git config submodule.buildtools.url "$srcdir/buildtools"
    git submodule update
}

build() {
	cd "$srcdir/$_gitname"
	make
}

package() {
	install -D "$srcdir/$_gitname/output/bannertool" "$pkgdir/usr/bin/bannertool"
}
