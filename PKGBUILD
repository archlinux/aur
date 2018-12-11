# Maintainer: <gdamjan@gmail.com>

pkgname=nextcloud-app-u2f
_releasename=twofactor_u2f
pkgver=2.0.3
pkgrel=1
pkgdesc="Two factor U2F provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/twofactor_u2f"
license=('AGPL')
depends=('nextcloud>=15.0')
makedepends=()
options=('!strip')
source=("${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/v${pkgver}/${_releasename}.tar.gz"
        'php-7.3.patch')

build() {
    cd "$srcdir/${_releasename}"
    patch -p1 -i "$srcdir/php-7.3.patch"
}

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('f689fef20d233b8154a2fb066dd164ec1420b047f37452339fd022088e9cfe9a'
            'c436e94fff898040896d40e46abf5091d3f9e0b6e289c19fbb47c80418ba7d79')
