# Maintainer: Arne Beer <arne@twobeer.de>

pkgname=encarne
pkgver=1.5.2
pkgrel=1
arch=('any')
pkgdesc='A program for automatic reencoding of all video containers to h.265 in a specific directory'
license=('MIT')
depends=('mediainfo' 'pueue' 'python-lxml' 'python-sqlalchemy' 'python-sqlalchemy-utils' 'python-humanfriendly')
makedepends=('python-setuptools')
provides=('encarne')
conflicts=('encarne-git')
url='https://github.com/nukesor/encarne'
source=("https://github.com/Nukesor/encarne/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${pkgname}-${pkgver}"

    # We don't need anything related to git in the package
    rm -rf .git*

    # Install
    python setup.py install --optimize=1 --root="${pkgdir}"

    install -dm777 "${pkgdir}/var/lib/encarne"

    # Place systemd user service
    install -Dm644 "utils/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # Install License
    # MIT/X11 license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
