# Maintainer: tee < teeaur at duck dot com >
_pkg=sqlpage
pkgname=sqlpage-bin
pkgver=0.48.0
pkgrel=1
pkgdesc='Fast SQL-only data application builder. Automatically build a UI on top of SQL queries'
arch=(x86_64)
url='https://sql-page.com'
_git='https://github.com/sqlpage/SQLPage'
license=('MIT')
provides=($_pkg)
conflicts=($_pkg)
depends=(glibc libgcc)
source=("$_git/raw/v$pkgver/sqlpage.service" "$_git/raw/v$pkgver/LICENSE.txt")
source_x86_64=("$_pkg-$pkgver.tgz::$_git/releases/download/v$pkgver/sqlpage-linux.tgz")
b2sums=('61a24d4d8d4a36e2eda6d09751401052a08e0cc8b7ba53b7ca3a95f366df854b96cbb19411d55b109623df209df56dbf3a3fec4a8617c64a06338606b0b66972'
        '950ac64948ed6489e2b3620a59c34348ee70d3816b13801fb0fc4a4da78fde97e4382c7a1968c587b32aaee3149e4a1915e89ed052821774f0c08b2cfbd8d7ec')
b2sums_x86_64=('625223e6d1e6508a3b2f5c36f755f177eafa26342deb87b4f458c68a7c4e359b15777219de1f50f748057151a019c8b417017a12112c459c8966583c33b2698c')

package() {
    install -Dm755 sqlpage.bin "$pkgdir/usr/bin/sqlpage"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    sed -i "s|/var/www/sqlpage|/srv/http|" sqlpage.service
    sed -i "s|/usr/local/bin/sqlpage\.bin|/bin/sqlpage|" sqlpage.service
    install -Dm644 sqlpage.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sqlpage/sqlpage.json -t "$pkgdir/usr/share/sqlpage"
    install -Dm644 sqlpage/migrations/README.md -t "$pkgdir/usr/share/sqlpage/migrations"
    install -Dm644 sqlpage/templates/README.md -t "$pkgdir/usr/share/sqlpage/templates"
}
# vim:set noet sts=0 sw=4 ts=4:
