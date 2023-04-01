# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Tilman Blumenbach <tilman@ax86.net>

pkgname=hd-idle
pkgver=1.05
pkgrel=4
pkgdesc='Utility program for spinning-down external disks after a period of idle time.'
arch=('x86_64')
backup=(etc/conf.d/hd-idle)
url="https://hd-idle.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("https://downloads.sf.net/$pkgname/$pkgname-$pkgver.tgz"
        "hd-idle.service")
md5sums=('5fa72fe717bc80011a79d6740d2903f3'
         '6e9162a075a7a99c3d10e9cde9c499df')
sha256sums=('4efefe79d145b50e055582730d9d685e485da3df3dad90fef030036d52aa3a0c'
            'fc0f9483fc2cf3e9e44a4f8d603357d9eb7037379d1bd5e0f6d838a9fca30b04')

build() {
    cd "$srcdir/$pkgname"
    sed -i 's|/sbin|/bin|' Makefile
    make
}

package() {
    cd "$srcdir/$pkgname"

    make TARGET_DIR="$pkgdir/usr" install

    install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 debian/hd-idle.default "$pkgdir/etc/conf.d/hd-idle"

    cd "$srcdir"
    install -Dm644 hd-idle.service "$pkgdir/usr/lib/systemd/system/hd-idle.service"
}

