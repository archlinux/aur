# Maintainer: killruana <killruana@gmail.com>
pkgname=qflow
pkgver=1.0.99
pkgrel=1
epoch=
pkgdesc='OSU 0.35um open-source standard cell set'
arch=('i686' 'x86_64')
url='http://opencircuitdesign.com/qflow/'
license=('GPL')
depends=('graywolf' 'qrouter' 'yosys')
source=("${url}archive/${pkgname}-${pkgver}.tgz"
        "${pkgname}.patch")
sha512sums=('6b6bb473b03552043684394c8ff5ef3c460a3d837a28627f278b87f1c970552119922e2965429269b7660184b76f507a69280dadae1344081e0f7d0f941921b7'
            '9115eaf1d8036ce21ec0a5568fe8a56ba2fb94b5898fe8347ae035e96b41462420a5161655995acff7be30b997f7dc2d4f0fba436dc9fe35ddce26912b77b40f')

prepare() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    patch -Np1 -i "${srcdir}/${pkgname}.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoconf -v
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
