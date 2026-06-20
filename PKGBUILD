# Maintainer: Egor Tensin <egor@tensin.name>
pkgname=config-links
pkgver=2.1.1
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

    find bin -type f -exec install -D -m 0755 -t "$pkgdir/usr/lib/$pkgname/bin" {} ';'
    find lib -type f -exec install -D -m 0644 -t "$pkgdir/usr/lib/$pkgname/lib" {} ';'

    install -d "$pkgdir/usr/bin"
    find "$pkgdir/usr/lib/$pkgname/bin" -type f -execdir ln -s -- "/usr/lib/$pkgname/bin/{}" "$pkgdir/usr/bin/" ';'
}
