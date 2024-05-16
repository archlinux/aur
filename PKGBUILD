# Maintainer: modula t. <modula-t at pm dot me>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=tap-plugins
pkgver=1.0.1
pkgrel=3
pkgdesc="Tom's LADSPA Plugins"
arch=(x86_64)
url="http://tap-plugins.sourceforge.net/"
license=(GPL2)
groups=(
    ladspa-plugins
    pro-audio
)
depends=(glibc)
makedepends=(git ladspa)
# source=(https://github.com/tomszilagyi/$pkgname/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
source=('tap-plugins::git+https://git.hq.sig7.se/tap-plugins.git')
sha512sums=('SKIP')
b2sums=('SKIP')

prepare() {
    # correct install path and add external LDFLAGS to achieve full RELRO
    sed -e 's|/usr/local/|$(DESTDIR)/usr/|; s/LDFLAGS = /LDFLAGS += /g' -i $srcdir/$pkgname/Makefile
}

build() {
    make -C $pkgname
}

package() {
    make DESTDIR="$pkgdir/" install -C $pkgname
    install -vDm 644 $pkgname/{CREDITS,README} -t "$pkgdir/usr/share/doc/$pkgname/"
}
