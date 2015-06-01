# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=torsocks-git
pkgver=2.1.0
epoch=1
pkgrel=1
pkgdesc='Torsocks allows you to use most socks-friendly applications in a safe way with Tor.'
url='https://gitweb.torproject.org/torsocks.git'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('tor')
conflicts=('torsocks' 'tsocks')
provides=('torsocks')
install='torsocks.install'
options=(!strip)

source=("git+https://git.torproject.org/torsocks.git")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/torsocks"
    git describe |sed 's/^v//;s/-/./g'
}

prepare() {
    cd "$srcdir/torsocks"
    ./autogen.sh
}

build() {
    cd "$srcdir/torsocks"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --datadir=/usr/share/torsocks \
        --docdir=/usr/share/torsocks
    make
}

package() {
    cd "$srcdir/torsocks"
    make DESTDIR="$pkgdir" install
    install -Dm644 "gpl-2.0.txt"  "$pkgdir/usr/share/licenses/torsocks/LICENSE"
}
