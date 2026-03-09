# Maintainer: tee < teeaur at duck dot com >
_pkg=sqlpage
pkgname=sqlpage-bin
pkgver=0.43.0
pkgrel=1
pkgdesc='Fast SQL-only data application builder. Automatically build a UI on top of SQL queries'
arch=(x86_64)
url='https://sql-page.com'
_git='https://github.com/sqlpage/SQLPage'
license=('MIT')
provides=($_pkg)
conflicts=($_pkg)
source=("$_git/raw/v$pkgver/sqlpage.service" "$_git/raw/v$pkgver/LICENSE.txt")
source_x86_64=("$_pkg-$pkgver.tgz::$_git/releases/download/v$pkgver/sqlpage-linux.tgz")
sha256sums=('523af5ae51e73365b7e7a8e2ce67c8b1eeb778a96792827581e3de1f41cac373'
            '9809766ebda83276892816cec11a3e1c938b3a71ace3db1f20ff028be8055e7c')
sha256sums_x86_64=('136c3f9b56448304d4f6dc85dd279a67c49ca32c16deb2a3c38f35519c2626f3')

package() {
    install -Dm755 sqlpage.bin "$pkgdir/usr/bin/sqlpage"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    sed -i "s|/var/www/sqlpage|/srv/http|" "$_pkg.service"
    sed -i "s|/usr/local/bin/sqlpage\.bin|/bin/$_pkg|" "$_pkg.service"
    install -Dm644 "$_pkg.service" -t "$pkgdir/etc/systemd/system"
    install -Dm644 sqlpage/sqlpage.json -t "$pkgdir/usr/share/sqlpage"
    install -Dm644 sqlpage/migrations/README.md -t "$pkgdir/usr/share/sqlpage/migrations"
    install -Dm644 sqlpage/templates/README.md -t "$pkgdir/usr/share/sqlpage/templates"
}
# vim:set noet sts=0 sw=4 ts=4:
