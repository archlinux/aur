# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Samuli Thomasson <samuli.thomasson@paivola.fi>

pkgname=agendav
pkgver=1.2.6.2
pkgrel=2
pkgdesc="Open source multilanguage CalDAV web client"
arch=(any)
url="http://agendav.org/"
license=('GPL')
depends=('php')
backup=("etc/webapps/agendav/config.php"
        "etc/webapps/agendav/caldav.php"
        "etc/webapps/agendav/database.php")
source=($pkgname-$pkgver.tar.gz::https://github.com/adobo/${pkgname}/archive/${pkgver}.tar.gz
        nginx.example.conf
        apache.example.conf)
install=$pkgname.install
sha1sums=('621a7fbb8909b4852ffa7e53dab086ca314d3cae'
          '8c2b1b02c09db5518cdccefd940094535957c3a7'
          'c742ec9ca86af8c984a3124db59004b30fd424a9')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    mkdir -p "${pkgdir}/etc/webapps/agendav"

    install -Dm644 web/config/config.php.template \
        "${pkgdir}/usr/share/webapps/agendav/web/config/config.php"
    install -Dm644 web/config/caldav.php.template \
        "${pkgdir}/usr/share/webapps/agendav/web/config/caldav.php"
    install -Dm644 web/config/database.php.template \
        "${pkgdir}/usr/share/webapps/agendav/web/config/database.php"

    ln -s /usr/share/webapps/agendav/web/config/config.php \
        "${pkgdir}/etc/webapps/agendav/config.php"
    ln -s /usr/share/webapps/agendav/web/config/caldav.php \
        "${pkgdir}/etc/webapps/agendav/caldav.php"
    ln -s /usr/share/webapps/agendav/web/config/database.php \
        "${pkgdir}/etc/webapps/agendav/database.php"

    install -Dm644 "$srcdir/nginx.example.conf" \
        "$pkgdir/etc/webapps/agendav/nginx.example.conf"

    install -Dm644 "$srcdir/apache.example.conf" \
        "$pkgdir/etc/webapps/agendav/apache.example.conf"

    find . -type f -exec \
        install -D -m644 {,"${pkgdir}/usr/share/webapps/agendav/"}{} \;

    ln -s ../config \
        "${pkgdir}/usr/share/webapps/agendav/web/application/config"
}
