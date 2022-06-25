# Maintainer: Maxim De Clercq <maximdeclercq00@gmail.com>
pkgname=qwbfsmanager-git
pkgver=1.2.6.r4.g68bfd4887a
pkgrel=1
pkgdesc='QWBFS Manager provides a cross platform Qt 4 GUI for working with hard disk drives that have been formatted to the WBFS file system.'
arch=('i686' 'x86_64')
url='https://github.com/pasnox/qwbfsmanager'
license=('LGPL3')
depends=('qt4')
makedepends=('git' 'fresh')
provides=("qwbfsmanager=$pkgver")
conflicts=('qwbfsmanager')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

pkgver() {
    cd "$pkgname"
    git describe --abbrev=10 --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    qmake-qt4 PREFIX="/usr/" "qwbfs.pro"
    make
}

package() {
    cd "$pkgname"
    make INSTALL_ROOT="$pkgdir/" install
}
