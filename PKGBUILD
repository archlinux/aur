# Maintainer: Pablo Lezaeta <prflr88@gmail.com>
# Contributor: BlackLotus89 <maxmusterm@gmail.com>

pkgname=toybox
pkgver=0.7.4
pkgrel=1
pkgdesc="A BSD-licensed alternative to busybox"
arch=("i686" "x86_64" "armv6h" "armv7h")
# I have no problems adding those architectures but in the moment that I get a single
# complain that not work the I will remove them
license=("BSD")
url="http://landley.net/toybox/"
#makedepends=('')
depends=('attr')
source=("${pkgname}-${pkgver}.tar.gz::http://landley.net/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz")

# ToDo, prepare that chage the system minimal UID and user UIDs to the ones used in arch

build() {
 cd "${srcdir}/${pkgname}-${pkgver}"

 msg "Runing script/make.sh to allow YOU to select the options as upstream want, yeah they ask me to do this"
 make menuconfig
 bash scripts/make.sh
}

package() {
 msg "Making directories"
 mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
 mkdir -p "${pkgdir}/usr/bin"

 msg "Creating the file using make install"
 cd "${srcdir}/${pkgname}-${pkgver}"
 PREFIX=${pkgdir}/usr/toybox/ make install

 msg "installing license"
 install -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/"
 cp "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/toybox/"
}

md5sums=('55ea59a31c7da9510c8fabe70f4bc561')
