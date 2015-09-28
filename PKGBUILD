# Maintainer: Martin Weinelt <martin@darmstadt.freifunk.net>

# things can get a little crashy at times, so better have debug symbols handy
# OPTIONS+=(debug !strip)

pkgname=tinc-pre-git
pkgver=1.1pre11.173.g7306823
pkgrel=1
pkgdesc="Virtual Private Network daemon (prerelease)"
arch=('any')
url="http://www.tinc-vpn.org/"
license=('GPL')
depends=('lzo2' 'zlib' 'openssl')
optdepends=('wxpython: gui support')
provides=('tinc-pre')
conflicts=('tinc' 'tinc-pre' 'tinc-pre-systemd')
source=('git+https://github.com/gsliepen/tinc#branch=1.1')
_gitname=tinc

pkgver() {
    cd "$_gitname"
    git describe --tags | sed 's/-/./g' | cut -d'.' -f2-
}

build() {
    cd "$_gitname"
    autoreconf -fsi
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --with-systemd=/usr/lib/systemd/system
    make
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
