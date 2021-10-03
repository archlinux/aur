# Maintainer: Egor Tensin <Egor.Tensin@gmail.com>
pkgname=linux-status
pkgver=1.0.1
pkgrel=1
pkgdesc='Simple Linux status web page'
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
    find img -type f -exec install -D -m 0644 -t "$pkgdir/srv/linux-status/img" {} ';'

    install -D -m 0755 -t "$pkgdir/srv/linux-status" app.py
    install -D -m 0755 -t "$pkgdir/srv/linux-status" server.py

    install -D -m 0644 -t "$pkgdir/srv/linux-status" index.html
    find css -type f -exec install -D -m 0644 -t "$pkgdir/srv/linux-status/css" {} ';'
    find js  -type f -exec install -D -m 0644 -t "$pkgdir/srv/linux-status/js"  {} ';'

    install -D -m 0644 -t "$pkgdir/usr/lib/systemd/system" dist/systemd/linux-status.service
}
