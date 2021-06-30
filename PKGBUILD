#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=reduze
pkgver=2.5
pkgrel=1
pkgdesc="Computer program for reducing Feynman integrals to master integrals employing a variant of Laporta's reduction algorithm."
arch=('i686' 'x86_64')
url="https://reduze.hepforge.org/"
license=('GPL3')
depends=('ginac')
makedepends=('cmake')
optdepends=('openmpi: For MPI support'
'db: For Berkeley DB support'
'fermat: For faster GCD calculations'
'doxygen: To create the docs for reduze')
source=("https://reduze.hepforge.org/download/reduze-${pkgver}.tar.gz")
sha256sums=('43c05ec8bc4c0865c92a326c4f482d67b4dc94ceaad9d7dbedfab3c4e099af8d')

build() {
cd ${srcdir}/reduze-"${pkgver}"
cmake -DCMAKE_INSTALL_PREFIX=${srcdir}/reduze-"${pkgver}" -DUSE_MPI=ON -DUSE_DATABASE=ON -DUSE_FERMAT=ON -S ${srcdir}/reduze-"${pkgver}"
make -j
make check
}

package() {
cd ${srcdir}/reduze-"${pkgver}"
make install

cd bin/
install -Dm755 reduze "${pkgdir}"/usr/bin/reduze
install -Dm755 reduze1to2 "${pkgdir}"/usr/bin/reduze1to2
cd ../share/reduze/
install -dm755 "${pkgdir}"/usr/share/reduze/
cp -r example/ "${pkgdir}"/usr/share/reduze/
cp -r tools/ "${pkgdir}"/usr/share/reduze/
cp -r tutorial/ "${pkgdir}"/usr/share/reduze/
}
