# Maintainer: Steven Cook <visage@deadhexagon.com>
# Contributor: Paul Colomiets <pc@gafol.net>

pkgname=mu-conference
pkgver=0.8.81
pkgrel=2
pkgdesc="Multi-user conference component for a jabber server"
arch=('i686' 'x86_64')
url="https://gna.org/projects/mu-conference/"
license=('GPL')
depends=('jabberd2')
backup=(
    'etc/jabberd/muc.xml'
)
source=(
    "http://download.gna.org/mu-conference/${pkgname}-${pkgver}.tar.gz"
    "mu-conference.service"
    "mu-conference.tmpfiles"
)
md5sums=('66f15f772dde0a8cfd94621ed795167c'
         '8f926f09ad3d2f92ff1f5d422efc11c2'
         'a8e674defd2f161d15be5f139fb90b65')
install="mu-conference.install"

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Create directories
    install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/${pkgname}/scripts"

    # Copy files
    cp scripts/* "${pkgdir}/usr/share/${pkgname}/scripts"

    install -Dm755 "src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "muc-default.xml" "${pkgdir}/etc/jabberd/muc.xml"
    install -Dm644 "muc-default.xml" "${pkgdir}/etc/jabberd/muc.xml.dist"

    # systemd service file
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/etc/tmpfiles.d/${pkgname}.conf"
}

