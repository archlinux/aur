# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.6.1
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm')
source=("polls-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ea9d9c1e6cddaff6f17022d6731542e79bcf194030873e87e80802863e2dfbafe30a158b0c642d88f0ceaa4b2f65ae9e9d8c4c428c03582145836512cb7ae9db')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make npm-init
    make appstore
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    rsync -a "${srcdir}/polls-${pkgver}/build/source/polls" \
        "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
