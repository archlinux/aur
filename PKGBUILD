# Maintainer: rafaelff <rafaelff@gnome.org>

_name=buzzmachines
pkgname=$_name-git
pkgver=20100517.r263.92aaed2
pkgrel=1
pkgdesc="Audio generators and effects using an API designed by Jeskola Buzz"
arch=('x86_64')
url="https://www.buzztrax.org/"
license=('LGPL-2.1-or-later')
makedepends=('git')
source=("git+https://github.com/Buzztrax/$_name.git")
md5sums=('SKIP')

pkgver() {
    cd "$_name"
    v=$(grep AC_INIT configure.ac | awk -F'[][]' '{print $4}')
    r=$(git rev-list --count HEAD)
    h=$(git rev-parse --short HEAD)
    printf "$v.r$r.$h"
}

build() {
    cd "$_name"
    ./autogen.sh --prefix=/usr                        
    make
}

package() {
    cd "$_name"
    make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}
