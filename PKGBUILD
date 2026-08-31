# Maintainer: tee < teeaur at duck dot com >
_pkg=sqlpage
pkgname=sqlpage-bin
pkgver=0.46.0
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
sha256sums=('523af5ae51e73365b7e7a8e2ce67c8b1eeb778a96792827581e3de1f41cac373'
            '9809766ebda83276892816cec11a3e1c938b3a71ace3db1f20ff028be8055e7c')
sha256sums_x86_64=('215f5a1bdf1dc021ec0d932eba011f87c74204f0481daff891a4ade98810b9f9')

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
