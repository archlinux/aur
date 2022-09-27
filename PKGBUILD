# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=scd2html
pkgver=1.0.0
pkgrel=1
license=('MIT')
pkgdesc='Tool for generating HTML from scdoc files'
depends=('glibc')
makedepends=('scdoc')
arch=('x86_64')
url='https://sr.ht/~bitfehler/scd2html/'
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('bf260106d69ebe5f9841cc5dd3d8e56b3e234aa81d468f195b9511970d58849edfbcf6962650fe36bd07f73151a48f2fdf0c504154976d386b4b9bfb60cb442d')

build() {
    cd "$pkgname-v$pkgver"
    # Upstream purposefully does not honor the user's LDFLAGS in order to keep
    # scdoc static. As we gain no benefit to statically linking and, in fact,
    # lose standard Arch practices (such as RELRO and PIE), we must override
    # LDFLAGS
    make PREFIX=/usr LDFLAGS="$LDFLAGS"
}

package() {
    cd "$pkgname-v$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
