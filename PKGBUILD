# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=gudhi
pkgver='3.0.0'
pkgrel=2
pkgdesc="Geometry understanding in higher dimensions"
arch=(any)
url="https://gudhi.inria.fr/"
license=('GPLv3')
groups=()
depends=('eigen' 'cgal' 'boost')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=

source=("https://gforge.inria.fr/frs/download.php/file/38130/${pkgname}.${pkgver}.tar.gz")
sha256sums=('5bc0fabf0ddf3b3bb79a63b030f667f30e74ce7fafae2b85ad73f1a25447d0ac')

build() {
    cd "${srcdir}/${pkgname}.${pkgver}"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd "${srcdir}/${pkgname}.${pkgver}/build"
    make DESTDIR=${pkgdir} install 
    cd "${srcdir}/${pkgname}.${pkgver}/build/python"
    python setup.py install --root="$pkgdir/" --optimize=1
}

