# Maintainer: SilverBut <SilverBut@users.noreply.github.com>
# Contributor: Martin Weinelt <martin@darmstadt.freifunk.net>

# things can get a little crashy at times, so better have debug symbols handy
# OPTIONS+=(debug !strip)

pkgname=tinc-pre-git
pkgver=1.1pre18.217.g84b24109
pkgrel=3
pkgdesc="VPN (Virtual Private Network) daemon (Latest commit on the pre-release branch)"
arch=('any')
url="http://www.tinc-vpn.org/"
license=('GPL')
depends=('lzo' 'openssl')
makedepends=('git' 'meson>=0.51')
optdepends=('python2' 'wxpython: gui support' 'miniupnpc')
provides=('tinc-pre')
conflicts=('tinc' 'tinc-pre' 'tinc-pre-systemd')
source=('git+https://github.com/gsliepen/tinc#branch=1.1')
_gitname=tinc

pkgver() {
    cd "$_gitname"
    git describe --long | sed 's/-/./g' | cut -d. -f2-
}

build() {
    cd "$_gitname"
    meson setup build --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
    meson compile -C build
}

package() {
    cd "$_gitname"
    meson install --destdir="$pkgdir" -C build
}

md5sums=('SKIP')
