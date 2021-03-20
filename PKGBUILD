# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.8.1
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm' 'php' 'composer')
source=("polls-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('673301927f3a2a0d80ebe451462c63e5af9b2c126b121d5001ccd06bf10dea81919dba84027ed02bf9c6bbe8377beeabcbae88188b44a2f0934bbd3488e5c188')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    rsync -a "${srcdir}/polls-${pkgver}/build/source/polls" \
        "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
