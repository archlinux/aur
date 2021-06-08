# Maintainer: 6543 <6543 at obermui dot de>

pkgname=adebar
pkgver=2.1.0
pkgrel=2
pkgdesc="Android DEvice Backup And Report, using Bash and ADB."
arch=("any")
url="https://codeberg.org/izzy/Adebar"
license=('GPL2')
depends=('bash' 'android-tools')
#source=("https://codeberg.org/izzy/${pkgname}/archive/v${pkgver}.tar.gz")
#sha1sums=('83cdab3aaafc16385506a260db26682d9f3efd34')
source=("https://codeberg.org/6543/Adebar/archive/make-adebar-system-instalable.tar.gz")
sha1sums=('1bcc9cb7f71658094058c0de460177f439947ab3')

package() {
    # adebar
    mkdir -p ${pkgdir}/usr/bin
    install -m755 ${srcdir}/${pkgname}/adebar-cli ${pkgdir}/usr/bin/$pkgname

    # lib
    mkdir -p ${pkgdir}/usr/lib/adebar
    install -D -m444 ${srcdir}/${pkgname}/lib/* ${pkgdir}/usr/lib/adebar

    # tools
    mkdir -p ${pkgdir}/usr/share/adebar
    install -D -m755 ${srcdir}/${pkgname}/tools/* ${pkgdir}/usr/share/adebar
}

build() {
    cd "${srcdir}/${pkgname}"
    sed -i "/BINDIR=/d" adebar-cli
    sed -i '/LIBDIR=/cLIBDIR=/usr/lib/adebar' adebar-cli
    sed -i '/^\ \ USER_CONF=/c\ \ mkdir -p "$USER_CONF"' adebar-cli
}
