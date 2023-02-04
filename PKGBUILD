# Maintainer: Egor Tensin <Egor.Tensin@gmail.com>
pkgname=linux-status
pkgver=2.3.2
pkgrel=1
pkgdesc='Simple Linux server monitoring'
arch=(any)
url='https://github.com/egor-tensin/linux-status'
license=(MIT)
depends=(procps-ng python systemd)
install=linux-status.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=(SKIP)

package() {
    cd "$srcdir"

    install -D -m 0644 -t "$pkgdir/usr/share/doc/linux-status" ../README.Arch

    cd "$pkgname-$pkgver"

    install -D -m 0644 -t "$pkgdir/usr/share/linux-status" LICENSE.txt

    install -D -m 0644 -t "$pkgdir/usr/share/doc/linux-status" README.md
    install -D -m 0644 -t "$pkgdir/usr/share/doc/linux-status/doc" doc/example.png

    install -D -m 0755 -t "$pkgdir/srv/linux-status" src/app.py
    install -D -m 0755 -t "$pkgdir/srv/linux-status" src/server.py

    cp -dr --preserve=mode,timestamp html "$pkgdir/srv/linux-status"

    install -D -m 0644 -t "$pkgdir/usr/lib/systemd/system" dist/systemd/linux-status.service
}
