# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=shishi
pkgver=1.0.3
pkgrel=2
pkgdesc="A free implementation of the Kerberos 5 network security system"
arch=('x86_64')
url="https://www.gnu.org/software/shishi/"
license=('GPL3')
depends=('libgcrypt' 'libgpg-error' 'libidn' 'libtasn1' 'gnutls')
backup=('etc/shishi/shisa.conf'
        'etc/shishi/shishi.conf')

source=("https://ftp.gnu.org/gnu/shishi/shishi-$pkgver.tar.gz"
        "shishid.service")
sha256sums=('95798ffd12dd01a4f88e0311ee03ca4a26e5cb4e5e9059a40e4fc4d9f2917e92'
            '0bf37f87fadaf1e3101e1ad4f3ad7aa69f47ac55efee32cce7aee2480cd27c99')

build() {
  cd "${srcdir}/shishi-$pkgver"
    ./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/shishi-$pkgver"
    mkdir -p -m 0700 "$pkgdir/var/shishi"
    make DESTDIR="${pkgdir}" install
    install -Dm0644 "$srcdir/shishid.service" "$pkgdir/usr/lib/systemd/system/shishid.service"
}
