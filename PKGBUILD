# Maintainer: TheCyberArcher@protonmail.ch>

pkgname=torsocks-git
pkgver=2.4.0
pkgrel=1
pkgdesc='Torsocks allows you to use most socks-friendly applications in a safe way with Tor.'
url='https://gitlab.torproject.org/tpo/core/torsocks.git'
license=('GPL2')
arch=('i686' 'x86_64')
conflicts=('torsocks')
provides=('torsocks')
backup=('etc/tor/torsocks.conf')
source=("https://gitlab.torproject.org/tpo/core/torsocks.git")
md5sums=('SKIP')

pkgver() {
    cd torsocks
    git describe |sed 's/^v//;s/-/./g'
}

prepare() {
    cd torsocks
    ./autogen.sh
}

build() {
    cd torsocks
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc
    make
}

check() {
    cd torsocks
    make check
}

package() {
    cd torsocks
    make DESTDIR="$pkgdir" install
    install -Dm644 extras/torsocks-bash_completion "$pkgdir/usr/share/bash-completion/completions/torsocks"
    install -Dm644 extras/torsocks-zsh_completion  "$pkgdir/usr/share/zsh/site-functions/_torsocks"
    install -Dm644 gpl-2.0.txt "$pkgdir/usr/share/licenses/torsocks/LICENSE"
}
