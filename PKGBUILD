# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.9.4
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm' 'php' 'composer')
source=("polls-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('3b9e209f14b4a05eed8c32efc8042d7751b7da821e9e57bc70cd3b84d1c9afcc53793fedb12784ba444726a4316db1e357a6540999d3dd5ec673d85650741f91')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    rsync -a "${srcdir}/polls-${pkgver}/build/source/polls" \
        "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
