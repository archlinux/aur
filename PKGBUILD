# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=tlog
pkgver=14
pkgrel=1
pkgdesc="Terminal I/O logger"
arch=(x86_64)
url="http://scribery.github.io/tlog/"
license=('GPL-2.0-or-later')
depends=(curl json-c libutempter)
backup=("etc/tlog/tlog-play.conf" "etc/tlog/tlog-rec.conf" "etc/tlog/tlog-rec-session.conf")
source=("https://github.com/Scribery/tlog/releases/download/v$pkgver/tlog-$pkgver.tar.gz"
        "rec-pointer-type-fix.patch")
sha512sums=('593d0d845b6b10de33094658160fb6d675d7f07493e5e3a84b20ea26154c56bb1f75a85805468bc061f0a14e305f6c2140e56e6cfa8e94d9849387d47f674ccd'
            '81b848816a98ae09ade89dc149fc02c79a21cf8dcc4a3f2d5009050e333ee06cd8ef6cf346c96546fe42cd5233b6e66a1769af137d20c6b6ee539a3c5cb64b40')

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np0 -i $srcdir/rec-pointer-type-fix.patch
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --enable-utempter --disable-static --disable-rpath --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
