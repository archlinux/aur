# Maintainer: bitwave <aur [at] oomlu [d0t] de>
# Contributor: A.J. Korf <jacobkorf at gmail dot com>

pkgname=tracebox-git
pkgver=260.079fcaf
pkgrel=2
pkgdesc="A Middlebox Detection Tool"
arch=(i686 x86_64)
url="http://www.tracebox.org/"
license=('none')
depends=('gcc-libs' 'lua' 'libpcap' 'json-c' 'curl' 'libnetfilter_queue')
source=('git://github.com/tracebox/tracebox')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/tracebox"
      echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/tracebox"
    ./bootstrap.sh
    ./configure --prefix=/usr --enable-sniffer --enable-curl
    make
}

package() {
    cd "$srcdir/tracebox"
    make install DESTDIR="$pkgdir"
}

