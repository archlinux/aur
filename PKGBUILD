# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.6.2
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm')
source=("polls-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('4e750a4645fe2e1f1f742d5a179ebdd21e69eeb62d9554c6d640d014dfb57115d4f5b42ace98f242158f9d4557d096e9242acadbbc04a7c497e03344d07cca9d')

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
