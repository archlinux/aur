# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Gökberk Yaltıraklı <aur at gkbrk dot com>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=aerc
pkgver=0.4.0
pkgrel=1
pkgdesc='Email Client for your Terminal'
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/aerc'
license=('MIT')
depends=('w3m' 'dante' 'notmuch')
makedepends=('go' 'git' 'scdoc')
provides=('aerc')
conflicts=('aerc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d369462cc0f76c33d804e586463e4d35d81fba9396ec08c3d3d0579e26091e17')

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
}
