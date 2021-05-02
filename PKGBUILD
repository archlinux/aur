# Maintainer: ReneganRonin <renegan.ronin@gmail.com> 

_name=delphes
pkgname=${_name}-git
pkgver=3.4.3pre11.r5.g952bbbc
#pkgver=3.4.3.r96.g3cfe61d
pkgrel=1
pkgdesc="A framework for fast simulation of a generic collider experiment"
url="http://cp3.irmp.ucl.ac.be/projects/delphes"
conflicts=('delphes')
provides=('delphes')
arch=('i686' 'x86_64')
license=('GPL3')
depends=("cmake"
         "root")
source=("${pkgname}::git+https://github.com/delphes/delphes.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr/" ${pkgname}
    make
}

package() {
    make install DESTDIR=${pkgdir}

    msg2 "Moving examples and cards"
    install -dm755 "${pkgdir}/usr/share/Delphes"
    install -dm755 ${pkgdir}/usr/examples ${pkgdir}/usr/share/Delphes/examples
    install -dm755 ${pkgdir}/usr/cards ${pkgdir}/usr/share/Delphes/cards
}

# Local Variables:
# mode: sh
# End:
