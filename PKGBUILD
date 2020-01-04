# Maintainer: Marius Lindvall <marius {cat} varden {dog} info>
pkgname=hauk-server
pkgver=1.6
pkgrel=2
pkgdesc="PHP backend for Hauk, a self-hosted real-time location sharing app"
arch=('any')
url="https://github.com/bilde2910/Hauk"
license=('Apache')
depends=('php>=7')
optdepends=('php-memcached: memcached storage support'
            'php-redis: Redis storage support'
            'php-ldap: user authentication against LDAP')
conflicts=()
install="${pkgname}.install"
source=("https://github.com/bilde2910/Hauk/archive/v${pkgver}.tar.gz"
        "apache-example.conf"
        "nginx-example.conf")
sha256sums=('5d8bc17bf2b51d6745fd1234a6a3ce9d1937eae23c575875dbe804741a463c81'
            'e20c609c08732ca47f198e7a247e2b3c95ffd66d3d71d00fe0351a6ebbf74915'
            '9777798bf9ffd4ec65fcb0dfcc2aab26d9288a6ae9e7cec410c210b5e001b440')
options=(!strip)
backup=("etc/hauk/config.php")

package() {
    mkdir -p "${pkgdir}/etc/hauk"
    mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r ./Hauk-${pkgver}/backend-php/* "${pkgdir}/usr/share/webapps/${pkgname}"
    cp -r ./Hauk-${pkgver}/frontend/* "${pkgdir}/usr/share/webapps/${pkgname}"
    install -Dm644 ./Hauk-${pkgver}/backend-php/include/config-sample.php "${pkgdir}/etc/hauk/config.php"
    install -Dm644 ./apache-example.conf "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 ./nginx-example.conf "${pkgdir}/usr/share/doc/${pkgname}"
}
