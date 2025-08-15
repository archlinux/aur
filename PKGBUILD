# Maintainer: jnd <jnd@8b.cz>
pkgname=poweradmin
pkgver=4.0.1
pkgrel=1
pkgdesc="A web-based DNS administration tool for PowerDNS server"
arch=('any')
url="https://www.poweradmin.org/"
license=('GPL3')
depends=(
    'php>=8.1'
    'powerdns>=4.0.0'
)
optdepends=(
    'php-gd: CAPTCHA support'
    'caddy: Caddy web server to host the application'
    'nginx: NGINX web server to host the application'
    'php-fpm: PHP FastCGI Process Manager for web server'
    'apache: Apache web server to host the application'
    'sqlite: Sqlite database backend'
    'php-sqlite: PHP module for sqlite'
    'mariadb: MariaDB database backend'
    'postgresql: PostgreSQL database backend'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/poweradmin/poweradmin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f0639355341a2f8744cdaeae4342421677b489ea5f74148f0b32ddf769975669')

package() {
    cd "$pkgname-$pkgver"

    # Install the application files
    install -d "$pkgdir/usr/share/webapps/$pkgname"
    cp -r ./* "$pkgdir/usr/share/webapps/$pkgname/"

    # Create a symlink to make it accessible
    ln -s "/usr/share/webapps/$pkgname" "$pkgdir/usr/share/webapps/poweradmin"

    # Set permissions for the new settings file
    chmod 640 "$pkgdir/usr/share/webapps/$pkgname/config/settings.defaults.php"

    # Set permissions for all other files and directories
    find "$pkgdir/usr/share/webapps/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/webapps/$pkgname" -type f -exec chmod 644 {} +
}
