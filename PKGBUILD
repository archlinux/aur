# $Id$
# Maintainer: ninian <mcfadzean.org.uk ta linux>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu-mouse-geometry
pkgver=4.7
pkgrel=1
pkgdesc="A generic menu for X, with added mouse and geometry support"
url="http://tools.suckless.org/dmenu/"
arch=('x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft' 'freetype2')
conflicts=('dmenu')
provides=('dmenu')
source=("http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz"
        "https://tools.suckless.org/dmenu/patches/dmenu-mousesupport-$pkgver.diff"
        "dmenu-geometry-$pkgver.diff")
sha256sums=('a75635f8dc2cbc280deecb906ad9b7594c5c31620e4a01ba30dc83984881f7b9'
            '084aa281c92bf87103121a031617c3ec10ee63ce40f955aefafc5dbded9489e5'
            'c3b3f699893e2bf132185b22419ea00d56e97a99e125e89709416e5e0196bef9')

prepare() {
  cd "$srcdir/dmenu-$pkgver"
  patch -p1 -i "$srcdir/dmenu-mousesupport-$pkgver.diff"
  patch -p1 -i "$srcdir/dmenu-geometry-$pkgver.diff"
}

build() {
  cd "$srcdir/dmenu-$pkgver"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd "$srcdir/dmenu-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
