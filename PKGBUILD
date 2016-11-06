# Maintainer: Titov Denis <kernelmd@yandex.ru>

pkgname=xapps-git
_pkgbasename=xapps
pkgver=r26.15e6611
pkgrel=1
pkgdesc="Common library for X-Apps project"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgnomekbd')
makedepends=('git')
provides=($_pkgname)
conflicts=(${_pkgbasename})
url='https://github.com/linuxmint/xapps'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname}

    ./autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${_pkgbasename}"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

