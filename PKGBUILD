# Contributor: Alexandr Parkhomenko <it@52tour.ru>

# Authors sites:
# http://www.quaoar.su
# https://gitlab.com/ssv/AnalysisSitus  # linux compatible not yet complete
# https://gitlab.com/ssv/active-data

pkgname=active-data
pkgver=1.5.0
pkgrel=1
pkgdesc='CAD model inspection utility and prototyping framework based on OpenCascade'
arch=('x86_64')
url='http://analysissitus.org/'
license=('BSD 3-clause')

depends=( 'opencascade>=7.2' 'intel-tbb' 
          #'boost-libs' # filesystem #using in TestLib and not included
)

makedepends=('cmake' 'gcc')

source=("https://gitlab.com/AlexandrParkhomenko/active-data/-/archive/v1.5.0/active-data-v${pkgver}.tar.gz")
sha256sums=("b5e66eec601c0f417b78ece22115f9c999b152bc1f2bfcb5920b7936d6e886f6")

build() {
    cd "${startdir}"
    if [ ! -d "build/active-data" ]; then
        mkdir -p build/active-data;
    fi
    cd build/active-data
    cmake ${srcdir}/active-data
    make -j `nproc`
}

package() {
    cd "${startdir}/build/active-data"
    make DESTDIR="${pkgdir}" install
}
