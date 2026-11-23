# Maintainer: thegala <thegala at disroot dot org>

_pkgname=exceptions4c
pkgname=${_pkgname}-git
pkgver=20250222.9f78795 
pkgrel=1
pkgdesc="Bring the power of exceptions to your C applications with this tiny, portable library."
arch=('x86_64')
url="https://exceptions4c.guillermo.in/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'automake' 'autoconf')
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
    make DESTDIR="$pkgdir" docs_DATA= install
}
