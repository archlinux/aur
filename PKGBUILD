# Maintainer: Dennis Stengele <dennis@stengele.me>

pkgname=beehive
pkgver=0.2
pkgrel=2
pkgdesc="A flexible event and agent system with lots of bees"
arch=('x86_64' 'i686')
url="https://github.com/muesli/beehive"
license=('AGPL3')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/muesli/${pkgname}/archive/v${pkgver}.tar.gz" beehive.install beehive.service)
sha256sums=('6d0f2587e3b9f1ff0ae75fec58a5f49c520497f8f4a16a96b1c1ad5e0e1466b5'
            '3a6725b9b51de4a8697c983844d742e499828af80d137f6ddc53523294111396'
            '9497c6fa7b157942fc4d962c6728b1fe90affcbd6bba5f3407f90784fd4a5405')

prepare() {
    cd "$pkgname-$pkgver"
    GOPATH=`pwd` go get -d -v
}

build() {
    cd "$pkgname-$pkgver"
    GOPATH=`pwd` go build
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd ${srcdir}
    install -Dm644 beehive.service "$pkgdir/usr/lib/systemd/system/beehive.service"
}

# vim:set ts=4 sw=4 et:
