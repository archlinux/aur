# Maintainer: quomoow <quomoow@gmail.com>
# Contributor: Nicolas Quiénot < niQo at aur >
# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=libpthread_workqueue-git
pkgver=rv0.9.2.51.g23fba31
_pkgver=v0.9.2
pkgrel=1
pkgdesc="A portable implementation of the pthread_workqueue API first introduced in Mac OS X."
url="https://github.com/mheily/libpwq"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('libpthread_workqueue' 'libpthread_workqueue-libpthread')
source=("${pkgname}"::"git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^=]*-g\)/r\1/;s/-/./g' 
}

build() {
    cd "${srcdir}/${pkgname}"

    autoreconf --install --symlink --verbose
    ./configure --prefix=/usr

    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR=${pkgdir} install
    install -Dvm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
