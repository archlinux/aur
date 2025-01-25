# Maintainer: nycex <nycex / cccp.org>
pkgname=pimsync
pkgver=0.2.0
pkgrel=1
pkgdesc='LPR and CUPS drivers for the Brother MFC-L3730CDN'
arch=('i686' 'x86_64')
url='https://pimsync.whynothugo.nl/'
license=('EUPL')
depends=('sqlite')
options=('!lto')
makedepends=('cargo' 'scdoc' 'tar')
source=("https://git.sr.ht/~whynothugo/pimsync/archive/v$pkgver.tar.gz")
b2sums=('0e5dbad48ecf419438b499c020c01072a8f70d23775bf082fa76b714c84c4cf8ad0cb2cf75497c0b71aa12964a2eb9d0e8961c4f4095828c55888e630d2ab9b2')

build() {
    tar xvf "v$pkgver.tar.gz"

    export PIMSYNC_VERSION="$pkgver"
    cd "pimsync-v$pkgver/"
    cargo build -p pimsync --release --locked
    make man
}

package() {
    cd "pimsync-v$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/$pkgname" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/man/man1/$pkgname.1" "target/$pkgname.1"
    install -Dm644 -t "$pkgdir/usr/share/man/man5/$pkgname.conf.5" "target/$pkgname.conf.5"
    install -Dm644 -t "$pkgdir/usr/share/man/man7/$pkgname-migration.7" "target/$pkgname-migration.7"
}
