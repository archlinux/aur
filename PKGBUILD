# Maintainer    : Dan Beste <dan.ray.beste@gmail.com>
# Contributor   : X0rg
# Contributor   : Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor   : Nicolas Quiénot < niQo at aur >
# Contributor   : Jens Staal <staal1978@gmail.com>

pkgname='lib32-libpthread_workqueue-git'
gitname='libpwq'
pkgver=0.9.2.r74.g97c63b4
pkgrel=1
pkgdesc='A portable implementation of the pthread_workqueue API first introduced in Mac OS X (32-bit)'
url='https://github.com/mheily/libpwq'
arch=(
    'i386'
    'x86_64'
)
license=('BSD')
depends=('lib32-glibc')
makedepends=(
    'git'
    'gcc-multilib'
)
provides=(
    'libpthread_workqueue'
    'libpthread_workqueue-libpthread'
)
source=('git+https://github.com/mheily/libpwq')
sha256sums=('SKIP')

pkgver() {
	cd "${gitname}"

    # TODO: Remove that additional sed statement
    git describe --long                     \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g'  \
        | sed 's/v//'
}

build() {
	cd "${gitname}"

	export CC="gcc -m32"
	export CXX="g++ -m32"
    
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
	cd "${gitname}/build"

	make DESTDIR="${pkgdir}" install

	install -Dm 644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
