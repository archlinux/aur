# Maintainer: Mickaël Gastineau <Mickael.Gastineau@obspm.fr>
pkgname=calceph
pkgver=4.0.5
pkgrel=1
pkgdesc='The library is designed to access the binary planetary ephemeris files, such INPOPxx and JPL DExxx ephemeris files'
url='https://www.imcce.fr/inpop/calceph'
license=('CECILL-C' 'CECILL-B' 'CECILL-2.1')
arch=('x86_64')
depends=('glibc'  'gcc-libs')
makedepends=('cmake>=3.12' 'gcc' 'gcc-fortran')
source=("https://www.imcce.fr/content/medias/recherche/equipes/asd/calceph/calceph-${pkgver}.tar.gz")
sha256sums=('3460d8a3e10a86e7fe0228d5d9abcda589713b8ed3ee007ce061ae01f8c2e1ea')


build() {
    cd "$pkgname-$pkgver"
    cmake -B build -S . -DBUILD_SHARED_LIBS=ON  -DCMAKE_INSTALL_PREFIX='/usr'  -Wno-dev 
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver"
    ctest --test-dir build --output-on-failure
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    install --mode=644 -D -t "$pkgdir/usr/share/licenses/${pkgname}/" LICENSE COPYING_* 
}
