# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Gökberk Yaltıraklı <aur at gkbrk dot com>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=aerc
pkgver=0.5.1
pkgrel=1
pkgdesc='Email Client for your Terminal'
arch=('x86_64' 'i686')
url='https://git.sr.ht/~sircmpwn/aerc'
license=('MIT')
depends=('notmuch')
makedepends=('go' 'git' 'scdoc')
optdepends=('w3m: html viewer support' 'dante: proxy support')
provides=('aerc')
conflicts=('aerc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8feb7f87aa210ab7d8b271c34ad39af13f553447994341b3c25e7a659ce37d46')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw -tags=notmuch"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR=$pkgdir install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/aerc/"
}
