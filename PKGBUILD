# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.8.3
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm' 'php' 'composer')
source=("polls-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('5fce0a59c69e188a661c74e00e280891c6d1d32b9f9a887a25a32026c7ac775bbbd037acb22f5b0b98c99765b6bf6f0b6ece63f19e2e2c1816d8a060e4d52837')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    rsync -a "${srcdir}/polls-${pkgver}/build/source/polls" \
        "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
