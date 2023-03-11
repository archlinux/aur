# Maintainer: 6543 <6543 at obermui dot de>

pkgname=adebar
pkgver=2.3.2
pkgrel=1
pkgdesc="Android DEvice Backup And Report, using Bash and ADB."
arch=("any")
url="https://codeberg.org/izzy/Adebar"
license=('GPL2')
depends=('bash' 'android-tools')
#source=("https://codeberg.org/izzy/${pkgname}/archive/v${pkgver}.tar.gz")
#sha1sums=('83cdab3aaafc16385506a260db26682d9f3efd34')
source=("https://codeberg.org/izzy/Adebar/archive/8308dedbf97533b495567aac5b7b49cc4bf421e2.tar.gz")
sha1sums=('d3b48546df9854409d7d508e9b281ea443b69316')

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
