# Maintainer: Carl George < arch at cgtx dot us >

pkgname="tilix"
pkgver=1.7.0
pkgrel=1
pkgdesc="A tiling terminal emulator for Linux using GTK+ 3"
arch=('x86_64' 'i686')
url="https://github.com/gnunn1/tilix"
license=('MPL')
depends=('libx11' 'gtkd' 'vte3' 'dconf' 'gsettings-desktop-schemas')
makedepends=('ldc' 'po4a')
optdepends=('python2-nautilus: for "Open Tilix Here" support in nautilus'\
            'vte3-notification: for desktop notifications support'\
            'vte3-tilix: for notifications, triggers and badges support'
            'libsecret: for the password manager')
provides=('terminix')
conflicts=('terminix')
replaces=('terminix')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('427a3819134be9977b01540a4eed0c107c848e23462f124b8cd0ffb42b73649b')

prepare() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr PO4A_TRANS=/usr/bin/vendor_perl/po4a-translate
    make DC='ldmd' DCFLAGS='-O -inline -release -version=StdLoggerDisableTrace'
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
