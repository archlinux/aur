# Maintainer: Egor Tensin <Egor.Tensin@gmail.com>
pkgname=config-links
pkgver=2.0.5
pkgrel=1
pkgdesc='Config file sharing'
arch=(any)
url="https://github.com/egor-tensin/$pkgname"
license=(MIT)
depends=(bash)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=(SKIP)

package() {
    cd -- "$srcdir"

    install -D -m 0644 -t "$pkgdir/usr/share/doc/$pkgname" "../README.Arch"

    cd -- "$pkgname-$pkgver"

    install -D -m 0644 -t "$pkgdir/usr/share/$pkgname" LICENSE.txt

    install -D -m 0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

    install -D -m 0755 -t "$pkgdir/usr/lib/$pkgname" links-update
    install -D -m 0755 -t "$pkgdir/usr/lib/$pkgname" links-remove
    install -D -m 0755 -t "$pkgdir/usr/lib/$pkgname" links-chmod
    find src -type f -exec install -D -m 0644 -t "$pkgdir/usr/lib/$pkgname/src" {} ';'

    install -d "$pkgdir/usr/bin"
    ln -s -- "/usr/lib/$pkgname/links-update" "$pkgdir/usr/bin/"
    ln -s -- "/usr/lib/$pkgname/links-remove" "$pkgdir/usr/bin/"
    ln -s -- "/usr/lib/$pkgname/links-chmod"  "$pkgdir/usr/bin/"
}
