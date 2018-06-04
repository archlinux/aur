# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=delphes
pkgver=3.4.1
pkgrel=2
pkgdesc="A framework for fast simulation of a generic collider experiment"
url="http://cp3.irmp.ucl.ac.be/projects/delphes"
arch=('i686' 'x86_64')
license=('GPL3')
depends=("cmake"
         "root")
source=("https://github.com/delphes/delphes/archive/${pkgver}.tar.gz"
        "1716933.patch")
sha256sums=('f234fa8f9dcaff0abb601766afd159fd648e8ab2f64da4aa32a5b258deee5213'
            '394ba6e9bdcd1396c02699de83ac98515de601d0103a06eefb6201b03b7195f3')

prepare() {
    patch -p 1 < 1716933.patch
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr/" delphes-${pkgver}
    make
}

package() {
    make install DESTDIR=${pkgdir}

    msg2 "Moving examples and cards"
    mkdir -p "${pkgdir}/usr/share/Delphes"
    mv "${pkgdir}/usr/examples" "${pkgdir}/usr/cards" "${pkgdir}/usr/share/Delphes/"
}

# Local Variables:
# mode: sh
# End:
