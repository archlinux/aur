# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=proxysql
pkgver=1.4.4
pkgrel=1
pkgdesc="High-performance MySQL proxy with a GPL license"
arch=('x86_64' 'amd64')
url="http://proxysql.com"
license=('GPL')
makedepends=('cmake' 'automake' 'bzip2' 'make' 'gcc' 'git' 'openssl' 'patch')
depends=('openssl')
provides=('proxysql')
source=("https://github.com/sysown/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d8a00eadd7100cb405d05e166daf9a44')

build() {
	cd "${pkgname}-${pkgver}"
        make
}

package() {
        useradd mysql
        groupadd mysql
        install -Dm 0755 "${srcdir}/${pkgname}-${pkgver}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        install -Dm 0600 "${srcdir}/${pkgname}-${pkgver}/etc/${pkgname}.cnf" "${pkgdir}/etc/${pkgname}.cnf"
        mkdir -p "${pkgdir}/var/lib/${pkgname}" 
        install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/systemd/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
