# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Nicolas Quiénot < niQo at aur >
# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=libpthread_workqueue-git
pkgver=20140727
pkgrel=1
pkgdesc="a portable implementation of the pthread_workqueue API first introduced in Mac OS X."
url="https://github.com/mheily/libpwq"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc' 'libkqueue')
makedepends=('git' 'pkgconfig')
provides=('libpthread_workqueue' 'libpthread_workqueue-libpthread')
source=("${pkgname}"::'git+https://github.com/mheily/libpwq')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "${srcdir}/${pkgname}"

    autoreconf --install --symlink --verbose
    ./configure --prefix=/usr

    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR=$pkgdir install
}
