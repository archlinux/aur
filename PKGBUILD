pkgname=reduze
pkgver=2.4
pkgrel=1
pkgdesc="Computer program for reducing Feynman integrals to master integrals employing a variant of Laporta's reduction algorithm."
arch=('i686' 'x86_64')
url="https://reduze.hepforge.org/"
license=('GPL3')
depends=('cmake' 'ginac')
optdepends=('openmpi: For MPI support'
'db: For Berkeley DB support'
'fermat: For faster GCD calculations'
'doxygen: To create the docs for reduze')
source=("https://reduze.hepforge.org/download/reduze-${pkgver}.tar.gz")
sha256sums=('107d6875104f464d677410aebee6d06737c11c5ba21c2bc85e8fab7d500076f6')

build() {
cd ${srcdir}/reduze-"${pkgver}"
cmake -DCMAKE_INSTALL_PREFIX=${srcdir}/reduze-"${pkgver}" -DUSE_MPI=ON -DUSE_DATABASE=ON -DUSE_FERMAT=ON -S ${srcdir}/reduze-"${pkgver}"
make -j1
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