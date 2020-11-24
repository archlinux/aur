# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.6.3
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm')
source=("polls-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('07c0a5af297179edbda4322cc4f275df1798108511eeeb6d4c49e9419b4877dc5cc3252105439b91c986a1c60334de05e2d568c4b29d5a1a53d750b92eb3a980')

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
