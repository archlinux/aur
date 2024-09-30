# Contributor: sen <sen@archlinux.us>
# Contributor: TheNiceGuy <gabriel14_wii@hotmail.com>
# Contributor: yechs <chshu@protonmail.ch>
# Maintainer: Ash <xash at riseup d0t net>

pkgname=spek-git
pkgver=v0.8.5.r15.gb1600d9
pkgrel=1
pkgdesc='Acoustic spectrum analyser.'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('GPL3')
depends=('ffmpeg' 'desktop-file-utils' 'wxgtk3')
makedepends=('git' 'pkgconfig' 'automake' 'intltool' 'gettext')
url='http://spek.cc'
conflicts=('spek')
provides=('spek')
source=('spek-git::git+https://github.com/alexkay/spek')
md5sums=('SKIP')
options=()

pkgver() {
    cd $pkgname
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR=$pkgdir install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
