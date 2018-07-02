# Maintainer: hexchain <i at hexchain.org>

pkgname="tpm2-abrmd"
pkgver="2.0.0"
pkgrel=1
pkgdesc="TPM2 Access Broker & Resource Manager"
license=('BSD')
arch=('x86_64')
depends=('glib2' 'tpm2-tss' 'dbus')
makedepends=('autoconf-archive' 'automake' 'cmocka' 'python')
url="https://github.com/intel/tpm2-abrmd"
source=("https://github.com/tpm2-software/tpm2-abrmd/releases/download/$pkgver/tpm2-abrmd-$pkgver.tar.gz"
        "tss.sysusers")
sha256sums=('adbb0a5410016e0ffa76dc968223720bfaa45266ef9cac65a76df5bd668e129f'
            '67d89be143dc129a95b0c1a42b3e92367a151289fb6c0655c054fccd62cd9a0e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --disable-static --with-pic
}

check() {
    msg2 "Skipping check for now..."
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$srcdir"
    install -Dm644 "tss.sysusers" "$pkgdir/usr/lib/sysusers.d/tss.conf"
}
