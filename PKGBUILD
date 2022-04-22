# Maintainer: Robin Candau <robincandau AT protonmail DOT com>
# Contributor: Julia <julia AT insertdomain DOT name>
# Contributor: Colin Reeder <colin AT reederhome DOT net>
# Contributor: Abraham Levine <arc AT plusreed DOT com>
pkgname=pa-applet-git
pkgver=19.3b4f8b3
pkgrel=1
pkgdesc="PulseAudio control applet"
arch=('any')
url="https://github.com/fernandotcl/pa-applet"
license=('BSD')
depends=('gtk3' 'libnotify' 'libpulse')
makedepends=('git')
options=('!libtool')
source=("$pkgname"::git+$url)
md5sums=('SKIP')

pkgver() {
            cd "$pkgname"
                echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
        cd "$srcdir/$pkgname"
        CFLAGS+=" -Wno-error"
        ./autogen.sh
        ./configure --prefix=/usr
        make
}

package() {
        cd "$srcdir/$pkgname"
        make DESTDIR="$pkgdir/" install
        install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
