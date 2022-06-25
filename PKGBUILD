# Maintainer: Maxim De Clercq <maximdeclercq00@gmail.com>
pkgname=fresh-git
pkgver=r359.a277a0f
pkgrel=1
pkgdesc='Fresh is a library extending the Qt library by adding new classes/widgets.'
arch=('i686' 'x86_64')
url='https://github.com/pasnox/fresh'
license=('LGPL3')
makedepends=('git' 'qt4')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    qmake-qt4 PREFIX="/usr/" "fresh.pro"
    make
}

package() {
    cd "$pkgname"
    make INSTALL_ROOT="$pkgdir/" install
}
