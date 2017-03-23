# Maintainer: Carl George < arch at cgtx dot us >

pkgname="tilix"
pkgver=1.5.4
pkgrel=3
pkgdesc="A tiling terminal emulator for Linux using GTK+ 3"
arch=('x86_64' 'i686')
url="https://github.com/gnunn1/tilix"
license=('MPL')
depends=('libx11' 'gtkd' 'vte3' 'dconf' 'gsettings-desktop-schemas')
makedepends=('ldc')
optdepends=('python2-nautilus: for "Open Tilix Here" support in nautilus'\
            'vte3-notification: for desktop notifications support'\
            'vte3-terminix-git: for notifications, triggers and badges support'
            'libsecret: for the password manager')
provides=('terminix')
conflicts=('terminix')
replaces=('terminix')
source=("$url/archive/$pkgver.tar.gz")
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e93af9e32aa0339fc539beaf0e171200e42149012dbde1bc753a8889babb55d1')

prepare() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make DC='ldmd' DCFLAGS='-O -inline -release -version=StdLoggerDisableTrace'
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
