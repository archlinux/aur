# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=sponsoryeet-git
pkgver=51.fa3ed52
pkgrel=1
pkgdesc="Yeets Youtube sponsors away from your chromecast"
arch=(i686 x86_64)
url="https://github.com/sandsmark/sponsoryeet"
license=(GPL3)
depends=(openssl) # Works with gnutls as well
makedepends=(git)
provides=(sponsoryeet)
conflicts=(sponsoryeet)
source=('git+https://github.com/sandsmark/sponsoryeet.git')
md5sums=('SKIP')

pkgver() {
    cd sponsoryeet
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd sponsoryeet
    make
}

package() {
    cd sponsoryeet
    make DESTDIR="$pkgdir" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/sponsoryeet/README"
}
