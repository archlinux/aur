# Maintainer: /dev/rs0 <rs0@secretco.de.com>

pkgname=pam-phidgetrfid
pkgver=1.0.6
pkgrel=4
pkgdesc="A PAM module that interfaces with a Phidget RFID tag scanner, passing IDs scanned by the scanner down the PAM stack as authentication tokens."

arch=('i686' 'x86_64')
url="http://pam-phidgetrfid.sourceforge.net/"
license=('LGPL3')

depends=('libphidget')

source=("http://sourceforge.net/projects/pam-phidgetrfid/files/pam-phidgetrfid-${pkgver}.tar.gz")
md5sums=('1848b82a187fde21fc0b109aefbc035b')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/share/licenses/pam-phidgetrfid"
    install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/pam-phidgetrfid/LICENSE"
    
    install -d "${pkgdir}/usr/share/doc/pam-phidgetrfid"
    install -Dm0644 README "${pkgdir}/usr/share/doc/pam-phidgetrfid"

    make DESTDIR="${pkgdir}" install
}
