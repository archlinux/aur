# Maintainer: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmenedez534 at gmail dot com>
# Contributor: Markus Opitz <mastero23 at gmail dot com>

pkgname=lttng-modules
pkgver=2.9.2
pkgrel=1
pkgdesc="LTTng kernel modules"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('LGPL2.1' 'GPL2' 'MIT')
depends=('linux>=2.6.38')
makedepends=('linux-headers')
optdepends=(
    'lttng-tools: LTTng tracing control tools'
    'babeltrace: trace viewer'
)
install=${pkgname}.install
source=(http://lttng.org/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('da54a8478019c0d551590c37826e78c058e9cb8b')

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make modules_install INSTALL_MOD_PATH=${pkgdir}/usr
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
