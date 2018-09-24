# Maintainer: nameful.tee <nameful.tee@protonmail.ch>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Hal Gentz <zegentzy@protonmail.com>

pkgname=blaze-git
pkgver=3.4.r84.d518c7ccf
pkgrel=1
pkgdesc="An open-source, high-performance C++ math library for dense and sparse arithmetic."
arch=('i686' 'x86_64')
url="https://bitbucket.org/blaze-lib/blaze"
license=('New BSD')
optdepends=('blas: for maximum performance.'
            'lapack: for computing the determinant of a dense matrix and for the dense matrix inversion.'
            'boost-libs: to use Boost threads to run numeric operations in parallel.')
makedepends=('git' 'cmake' 'blas' 'lapack' 'boost-libs')
provides=('blaze')
conflicts=('blaze')
source=("${pkgname}::git+https://bitbucket.org/blaze-lib/blaze.git")
md5sums=('SKIP')

pkgver() 
{
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"
    cmake "${srcdir}/${pkgname}" \
        -DCMAKE_INSTALL_PREFIX="/usr"
}

package()
{
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install

    # Install LICENSE file
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
