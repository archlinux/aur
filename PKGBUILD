# Maintainer: Walter Dworak <preparationh67@gmail.com>
# Contributor: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=kanboard
pkgver=1.2.11
pkgrel=3
pkgdesc='Simple visual task board'
arch=('any')
url='http://kanboard.net/'
license=('MIT')
depends=('php' 'php-gd')
optdepends=('mariadb: For MySQL storage' 'php-sqlite: For sqlite storage' 'php-pgsql: For postgres storage')
backup=('etc/webapps/kanboard/config.php' 'etc/webapps/kanboard/kanboard-apache.conf' 'etc/webapps/kanboard/kanboard-nginx.conf'
'etc/webapps/kanboard/kanboard-nginx-subdir.conf')
install="$pkgname.install"
options=(!strip)
source=("https://github.com/kanboard/kanboard/archive/v$pkgver/kanboard-$pkgver.zip"
	"kanboard-apache.conf"
	"kanboard-nginx.conf"
	"kanboard-nginx-subdir.conf"
	"kanboard-cron"
	"kanboard.service"
	"kanboard.timer"
 	"config.patch")
validpgpkeys=(
	'DCF1D3CBC1E43342116F760E112C718C894226ED'
	'112C718C894226ED')
#source=("http://kanboard.net/kanboard-$pkgver.zip"
package() {
    mkdir -p ${pkgdir}/usr/share/webapps
    mkdir -p ${pkgdir}/usr/lib/systemd/system
    mkdir -p ${pkgdir}/usr/share/licenses/kanboard
    patch ${srcdir}/${pkgname}-${pkgver}/config.default.php ${srcdir}/config.patch
    cp -R ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/usr/share/webapps/${pkgname}
    install -D -m 644 "${srcdir}/kanboard-apache.conf" ${pkgdir}/etc/webapps/${pkgname}/kanboard-apache.conf
    install -D -m 644 "${srcdir}/kanboard-nginx.conf" ${pkgdir}/etc/webapps/${pkgname}/kanboard-nginx.conf
    install -D -m 644 "${srcdir}/kanboard-nginx-subdir.conf" ${pkgdir}/etc/webapps/${pkgname}/kanboard-nginx-subdir.conf
    install -D -m 644 "${srcdir}/kanboard-cron" ${pkgdir}/etc/webapps/${pkgname}/kanboard-cron
    install -D -m 644 "${srcdir}/kanboard.service" ${pkgdir}/usr/lib/systemd/system/kanboard.service
    install -D -m 644 "${srcdir}/kanboard.timer" ${pkgdir}/usr/lib/systemd/system/kanboard.timer
    install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" ${pkgdir}/usr/share/licenses/kanboard/LICENSE
    cp ${pkgdir}/usr/share/webapps/${pkgname}/config.default.php ${pkgdir}/etc/webapps/${pkgname}/config.php
}

sha256sums=('0424ebe188919311708100cf0122b9e78b9e34c3aef0160c069f0b201c39ac86'
            '6eb379e74f744d95a930c90ae7744cb8236501bdcd24c7efb6a2eaf1a857204f'
            '62853c973e5b0718ceae5dbeb76b478bb218ce89d732e66a5eef1c7c258ea4b4'
            '5fdf81a69cda8c3c813e5d21f62d4112264645c95d376d7b31dae4573724930a'
            '0efff866815a47329767bb00482f9fc1adff77a6e0e62889ea666ecd930d6f1d'
            '5353560c7664db99a2845a39750a2c5e62045083f7e3f835a198158faa809c64'
            'b030b1655cfca20700faa5d3f4dac87bacc24e7070517af041f2ffb25ba46292'
            '3dfa63a56e11185132a07c146dcaf1d5131fd61e610fdb463e039eb8ff2fb944')
