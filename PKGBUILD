# Maintainer    : Dan Beste <dan.ray.beste@gmail.com>
# Contributor   : X0rg
# Contributor   : Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor   : Nicolas Quiénot < niQo at aur >
# Contributor   : Jens Staal <staal1978@gmail.com>

pkgname="lib32-libpthread_workqueue-git"
gitname='libpwq'
pkgver=r363.97c63b4
pkgrel=1
pkgdesc='A portable implementation of the pthread_workqueue API first introduced in Mac OS X (32-bit)'
url='https://github.com/mheily/libpwq'
arch=(
    'x86_64'
)
license=(
    'BSD'
)
depends=(
    'lib32-glibc'
)
# 'libpthread_workqueue-git'
makedepends=(
    'git'
    'gcc-multilib'
)
provides=(
    'libpthread_workqueue'
    'libpthread_workqueue-libpthread'
)
source=('git+https://github.com/mheily/libpwq')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${gitname}" || exit 1

    printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${gitname}" || exit 1

	export CC="gcc -m32"
	export CXX="g++ -m32"
    
    mkdir -p build && cd build || exit 1

    cmake ..
    make
}

package() {
	cd "${srcdir}/${gitname}/build" || exit 1

	make DESTDIR="${pkgdir}" install

	install -Dvm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
