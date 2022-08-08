# Maintainer: Pig2014 <18111431031@163.com>

pkgname=plikd
pkgver=1.3.6
pkgrel=1
pkgdesc="A temporary file upload system (Wetransfer like) in Go"
url="https://github.com/root-gg/plik"
arch=(x86_64)
license=("MIT")
optdepends=("postgresql: to use postgreSQL as database backend"
            "mysql: to use MySQL as database backend"
            "mariadb: to use MariaDB as database backend")
source=("https://github.com/root-gg/plik/releases/download/${pkgver}/plik-${pkgver}-linux-amd64.tar.gz"
        "plikd_config.patch"
        "plikd.service")
sha512sums=('0efa4ad5928c91be2c5a1dcad2ac7bfd886025d06b37fc516028f806b52b53f5fc75cbec133b1239e4a48aa152c709d6df2194a2dcdbb9ab55be69a40dfe6d82'
            '136b6101ede174c077dfee7de360cc71a2e6ef7108621fc0814ae1743fa24f129afe5af27f52af8e0047ddd4d29f0f5b2efe37f83a151271f86eee81ea85fbdb'
            '0919894c38fccd105526b08f6a7c96a06412ad59d99c720fde2d43daa74f7bc60527af5c06671e1f5102456be93131626fd87a4c3803cd457bfa82cf65a3b8e0')

prepare() {
    patch plik-${pkgver}-linux-amd64/server/plikd.cfg plikd_config.patch
}

package() {
    install -Dm 755 "${srcdir}"/plik-${pkgver}-linux-amd64/server/plikd "${pkgdir}"/usr/bin/plikd
    install -Dm 644 "${srcdir}"/plik-${pkgver}-linux-amd64/server/plikd.cfg "${pkgdir}"/etc/plikd.cfg
    install -dm 644 "${srcdir}"/plik-${pkgver}-linux-amd64/webapp "${pkgdir}"/usr/share/webapps/plikd
    mv -T "${srcdir}"/plik-${pkgver}-linux-amd64/webapp "${pkgdir}"/usr/share/webapps/plikd
    install -dm 644 "${srcdir}"/plik-${pkgver}-linux-amd64/changelog "${pkgdir}"/usr/share/webapps/plikd/changelog
    mv -T "${srcdir}"/plik-${pkgver}-linux-amd64/changelog "${pkgdir}"/usr/share/webapps/plikd/changelog
    install -dm 644 "${srcdir}"/plik-${pkgver}-linux-amd64/clients "${pkgdir}"/usr/share/webapps/plikd/clients
    mv -T "${srcdir}"/plik-${pkgver}-linux-amd64/clients "${pkgdir}"/usr/share/webapps/plikd/clients
    install -dm 600 "${pkgdir}"/var/lib/plikd
    install -Dm 644 "${srcdir}"/plikd.service "${pkgdir}"/usr/lib/systemd/system/plikd.service
}


