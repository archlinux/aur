# Maintainer: Marius Lindvall <marius {cat} varden {dog} info>
pkgname=hauk-server
pkgver=1.6
pkgrel=1
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
            '44eb91f5c8f5b20bcb6105b06c0f6b7a7b7a2b54a91a2dc9abbc993a6d410bca'
            'b48e1dc0519d0359936da330d8478cb4102f53553d7825844196fe0962df61bd')
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
