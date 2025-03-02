# Maintainer: nycex <nycex / cccp.org>
pkgname=pimsync
pkgver=0.3.0
pkgrel=1
pkgdesc='command like to to synchronise calendars and contacts between storages (CalDAV/CardDAV) (vdirsyncer successor)'
arch=('i686' 'x86_64')
url='https://pimsync.whynothugo.nl/'
license=('EUPL')
depends=('sqlite')
options=('!lto')
makedepends=('cargo' 'scdoc' 'tar')
source=("https://git.sr.ht/~whynothugo/pimsync/archive/v$pkgver.tar.gz")
b2sums=('3717f1ed1ee85c429840d3095b1707efa053d54e2845e2f4cc0e649c01d0f014fe4431a70416c991d3ceff72c556cd2661639d274432fa6225a89bb0dd6a547b')

build() {
    export PIMSYNC_VERSION="$pkgver"
    cd "pimsync-v$pkgver/"
    cargo build -p pimsync --release --locked
    make man
}

package() {
    cd "pimsync-v$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/man/man1/" "target/$pkgname.1"
    install -Dm644 -t "$pkgdir/usr/share/man/man5/" "target/$pkgname.conf.5"
    install -Dm644 -t "$pkgdir/usr/share/man/man7/" "target/$pkgname-migration.7"
}
