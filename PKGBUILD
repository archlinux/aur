# Maintainer: Walter Dworak <preparationh67@gmail.com>
# Contributor: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=kanboard
pkgver=1.0.45
pkgrel=2
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
source=("http://kanboard.net/kanboard-$pkgver.zip"
	"kanboard-apache.conf"
	"kanboard-nginx.conf"
	"kanboard-nginx-subdir.conf"
	"kanboard-cron"
	"kanboard.service"
	"kanboard.timer")

package() {
    mkdir -p ${pkgdir}/usr/share/webapps
    mkdir -p ${pkgdir}/usr/lib/systemd/system
    mkdir -p ${pkgdir}/usr/share/licenses/kanboard
    cp -R ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/${pkgname}
    install -D "${srcdir}/kanboard-apache.conf" ${pkgdir}/etc/webapps/${pkgname}/kanboard-apache.conf
    install -D "${srcdir}/kanboard-nginx.conf" ${pkgdir}/etc/webapps/${pkgname}/kanboard-nginx.conf
    install -D "${srcdir}/kanboard-nginx-subdir.conf" ${pkgdir}/etc/webapps/${pkgname}/kanboard-nginx-subdir.conf
    install -D "${srcdir}/kanboard-cron" ${pkgdir}/etc/webapps/${pkgname}/kanboard-cron
    install -D "${srcdir}/kanboard.service" ${pkgdir}/usr/lib/systemd/system/kanboard.service
    install -D "${srcdir}/kanboard.timer" ${pkgdir}/usr/lib/systemd/system/kanboard.timer
    install -D "${srcdir}/${pkgname}/LICENSE" ${pkgdir}/usr/share/licenses/kanboard/LICENSE
    cp ${pkgdir}/usr/share/webapps/${pkgname}/config.default.php ${pkgdir}/etc/webapps/${pkgname}/config.php
}

sha256sums=('4364ca31a6905919264e89cc9229a4439fcb93fa53a5170242ba109cc223828a'
            '6eb379e74f744d95a930c90ae7744cb8236501bdcd24c7efb6a2eaf1a857204f'
            '62853c973e5b0718ceae5dbeb76b478bb218ce89d732e66a5eef1c7c258ea4b4'
            '5fdf81a69cda8c3c813e5d21f62d4112264645c95d376d7b31dae4573724930a'
            '0efff866815a47329767bb00482f9fc1adff77a6e0e62889ea666ecd930d6f1d'
            '2749d339f8ff0c512ddda75cc6bcbe0e83929b3e565c706f1b521ca2d8667377'
            'b030b1655cfca20700faa5d3f4dac87bacc24e7070517af041f2ffb25ba46292')
