# Maintainer: Ash <xash at riseup d0t net>
# Former Maintainer: Joel Grunbaum <joelgrun@gmail.com>
# Contributor: R1D3R175

pkgname=spek-x-git
pkgver=0.9.4.r0.gb3b8978
pkgrel=1
pkgdesc='Acoustic spectrum analyser forked from spek.'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('GPL3')
depends=('ffmpeg' 'wxwidgets-gtk3')
makedepends=('git' 'pkgconfig' 'automake' 'intltool' 'gettext')
url='https://github.com/MikeWang000000/spek-X'
conflicts=('spek')
provides=('spek')
source=('spek-x-git::git+https://github.com/MikeWang000000/spek-X'
        'fix_autogen.patch')
md5sums=('SKIP'
         '3ffa85d8f4534a67fd160687ece07014')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 < "$srcdir/fix_autogen.patch"
}

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENCE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
