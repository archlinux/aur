# Maintainer: Walter Dworak <preparationh67@gmail.com>
# Contributor: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=kanboard
pkgver=1.0.19
pkgrel=3
pkgdesc='Simple visual task board'
arch=('any')
url='http://kanboard.net/'
license=('AGL3')
depends=('php' 'php-gd')
optdepends=('mariadb: For MySQL storage' 'php-sqlite: For sqlite storage' 'php-pgsql: For postgres storage')
install="$pkgname.install"
options=(!strip)
source=("https://github.com/fguillot/$pkgname/archive/v$pkgver.tar.gz"
	"kanboard-apache.conf"
	"kanboard-cron")
sha256sums=('53d86c97068deb08763e337d3bb1ba42210397e248f6d1401605b3225a932ae4'
            '6eb379e74f744d95a930c90ae7744cb8236501bdcd24c7efb6a2eaf1a857204f'
            'c777fe8364ca82db7956e665b8b700739b352fe4043869c33dc8ef788e3b1822')

package() {
    mkdir -p ${pkgdir}/usr/share/webapps
    cp -R ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/usr/share/webapps/${pkgname}
    install -D "${srcdir}/kanboard-apache.conf" ${pkgdir}/etc/webapps/${pkgname}
    install -D "${srcdir}/kanboard-cron" ${pkgdir}/etc/cron.d
    cp ${pkgdir}/usr/share/webapps/${pkgname}/config.default.php ${pkgdir}/etc/webapps/${pkgname}/config.php
    ln -s /etc/webapps/${pkgname}/config.php ${pkgname}/usr/share/webapps/${pkgname}/config.php
}

