# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Orestis Floros <orestisflo@gmail.com>

pkgname=csmith-git
pkgver=r845.deddca6
pkgrel=1
pkgdesc='A random generator of C programs'
arch=('i686' 'x86_64')
url='https://github.com/csmith-project/csmith'
license=('BSD')
optdepends=('perl')
makedepends=('git' 'cmake')
conflicts=('csmith')
source=("git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd csmith
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd csmith
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd csmith
    make DESTDIR="${pkgdir}/" install
    install --directory "${pkgdir}/usr/share/licenses/${pkgname}/"
    install COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
