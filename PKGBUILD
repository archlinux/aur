# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.7.5
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm' 'php' 'composer')
source=("polls-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ff1178f5fe460aebd0bca939a56a31e8176ae723e1d267e62a41fd5e912f3f29cba9fa090f5336f80629655332179bc2e02f62803f706ce4d7e0df5c76718d79')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make composer
    make npm-init
    make appstore
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    rsync -a "${srcdir}/polls-${pkgver}/build/source/polls" \
        "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
