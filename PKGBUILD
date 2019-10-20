# Maintainer: Ruben De Smet <rdesmeta at etrovub dot be>
# Based on wingide (pro) by: Grey Christoforo <first name [at] last name [dot] net>

pkgname=wingide-101
pkgver=7.1.2.0
pkgrel=1
pkgdesc="Wing 101 is a very simple free Python IDE designed for teaching beginning programmers. It omits most features found in Wing Pro."
arch=(x86_64)
url="https://wingware.com/downloads/wingide-101"
license=('custom')
depends=('python')
install=${pkgname}.install

source=(https://wingware.com/pub/wingide-101/$pkgver/wing-101-$pkgver-linux-x64.tar.bz2)

sha256sums=('2d190c0d67bdf8daeab241130379c30a358130802b9d274290c4dea8a48cbd07')

# prepare() {
# }

package() {
    cd $srcdir/wing-101-$pkgver-linux-x64/
    python wing-install.py \
        --install-binary \
        --winghome "${pkgdir}/opt/${pkgname}" \
        --bin-dir "${pkgdir}/usr/bin"

    # Correct the WINGHOME environment variable
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wingdbstub.py
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wing-101

    chown -R root:root "${pkgdir}/opt/${pkgname}"
    chmod +x ${pkgdir}/opt/${pkgname}/resources/linux/desktop/install-linux-desktop.sh
    # Correct the WINGHOME environment variable
    chown -R root:root "${pkgdir}/opt/${pkgname}"
}
