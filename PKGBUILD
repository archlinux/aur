# Maintainer: tee < teeaur at duck dot com >
_pkg=sqlpage
pkgname=sqlpage-bin
pkgver=0.40.0
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
sha256sums_x86_64=('be0824d12fe6ddc690266f3ddb5b99508fd380e3c43f58eead82a0560c51f2b1')

package() {
    install -Dm755 sqlpage.bin "$pkgdir/usr/bin/sqlpage"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    install -dm644 "$pkgdir/usr/share/sqlpage"
    sed -i "s|/var/www/sqlpage|/srv/http|" "$_pkg.service"
    sed -i "s|/usr/local/bin/sqlpage\.bin|/bin/$_pkg|" "$_pkg.service"
    install -Dm644 "$_pkg.service" "$pkgdir/etc/systemd/system/$_pkg.service"
    cp -a sqlpage/* "$pkgdir/usr/share/sqlpage"
}
# vim:set noet sts=0 sw=4 ts=4:
