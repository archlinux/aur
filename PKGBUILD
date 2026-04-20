# Maintainer: Aaron Gerbert <aaronred345@gmail.com>
pkgname=steam-prefix-shortcut
pkgver=1.1.0
pkgrel=1
pkgdesc="Creates symbolic links to Proton/Wine prefixes for Steam games running through Proton"
arch=('any')
url="https://github.com/aaronred345/SteamPrefixShorcut"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ae3a7aaa23b7e150dcd42f519fcb7445e9adcd33089a700eb60b8ed87f362ea')

package() {
    cd "$srcdir/SteamPrefixShorcut-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/steam-prefix"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -dm755 "$pkgdir/etc/profile.d"
    printf '%s\n' '/usr/bin/steam-prefix > /dev/null 2>&1 &' \
        > "$pkgdir/etc/profile.d/steam-prefix.sh"
    chmod 644 "$pkgdir/etc/profile.d/steam-prefix.sh"
}
