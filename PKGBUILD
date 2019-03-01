# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

pkgname=torsocks-git
pkgver=2.3.0.1.g4c00ec8
pkgrel=1
pkgdesc='Torsocks allows you to use most socks-friendly applications in a safe way with Tor.'
url='https://gitweb.torproject.org/torsocks.git'
license=('GPL2')
arch=('i686' 'x86_64')
conflicts=('torsocks')
provides=('torsocks')
backup=('etc/tor/torsocks.conf')
source=("git+https://git.torproject.org/torsocks.git#branch=master")
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
