# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contriburo: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgbase=awl
pkgname=('awl' 'awl-docs')
pkgver=0.60
pkgrel=2
pkgdesc="Andrew's Web Libraries"
arch=('any')
url="https://gitlab.com/davical-project/awl/"
license=('GPL2')
depends=('php')
makedepends=('doxygen' 'graphviz')
options=('!strip')
install=${pkgbase}.install
source=("${pkgbase}-${pkgver}.tar.bz2::https://gitlab.com/davical-project/${pkgbase}/repository/archive.tar.bz2?ref=r${pkgver}")
sha512sums=('2604d92e6541da76be57c5700d360ffd512047ace951b1597c622456a2898871dc101646f52cd5da1aa4c3c5b4e2629bc7fdee9e12f874e0971790e9d0f8f703')

package_awl() {
    pkgdesc="Andrew's Web Libraries - PHP Utility Libraries"
    depends=('php')
    makedepends=()
    optdepends=('awl-docs')

    cd "${srcdir}/${pkgbase}-r${pkgver}-"*

    # create directory
    install -D -dm755 "${pkgdir}/usr/share/${pkgbase}"

    # install package
    cp -ra dba inc "${pkgdir}/usr/share/${pkgbase}"
}

package_awl-docs() {
    pkgdesc="Andrew's Web Libraries - API documentation"
    depends=()
    makedepends=('doxygen' 'graphviz')

    cd "${srcdir}/${pkgbase}-r${pkgver}-"*

    # create directory
    install -D -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"

    # build documentation
    sed 's/^STRIP_FROM_PATH.*/STRIP_FROM_PATH = ..\//' docs/Doxyfile | doxygen -

    # install package documentation
    cp -ra docs/api/* "${pkgdir}/usr/share/doc/${pkgbase}"
}
