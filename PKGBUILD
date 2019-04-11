# Maintainer: thegala <thegala at disroot dot org>

_pkgname=exceptions4c
pkgname=${_pkgname}-git
pkgver=cce5399 
pkgrel=1
pkgdesc="Bring the power of exceptions to your C applications with this tiny, portable library."
arch=('any')
url="https://exceptions4c.guillermo.in/"
license=('LGPL')
depends=('glibc')
makedepends=('automake' 'autoconf')
source=("${_pkgname}::git+https://github.com/guillermocalvo/exceptions4c.git")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${_pkgname}"
    aclocal
    autoconf
    automake --add-missing
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    #pkgver=$(git log -1 --format='%cd.%h' --date=short | tr -d -)
    git log -1 --format='%cd.%h' --date=short | tr -d -

}
                    

build() {
	cd "${srcdir}/${_pkgname}"

    ./configure --prefix=/usr
    #./configure 
    make
}

package() {
	cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir" install
}
