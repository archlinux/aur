# Maintainer: Egor Tensin <Egor.Tensin@gmail.com>
pkgname=linux-status
pkgver=2.4.4
pkgrel=1
pkgdesc='Simple Linux server monitoring'
arch=(any)
url="https://github.com/egor-tensin/$pkgname"
license=(MIT)
depends=(procps-ng python systemd)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=(SKIP)

package() {
    cd -- "$srcdir"

    install -D -m 0644 -t "$pkgdir/usr/share/doc/$pkgname" ../README.Arch

    cd -- "$pkgname-$pkgver"

    install -D -m 0644 -t "$pkgdir/usr/share/$pkgname" LICENSE.txt

    install -D -m 0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -D -m 0644 -t "$pkgdir/usr/share/doc/$pkgname/doc" doc/example.png

    install -D -m 0755 -t "$pkgdir/srv/$pkgname" src/app.py
    install -D -m 0755 -t "$pkgdir/srv/$pkgname" src/server.py

    cp -dr --preserve=mode,timestamp -- html "$pkgdir/srv/$pkgname"

    install -D -m 0644 -t "$pkgdir/usr/lib/systemd/system" "dist/systemd/$pkgname.service"
}
