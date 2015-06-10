# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Stefan Husmann <stefan.husmann@t-online.de>
# Contributor: flixie <69one@gmx.net>
pkgname=ctwm
pkgver=3.8.2
pkgrel=1
pkgdesc="Richard's Tab Window Manager"
arch=('x86_64' 'i686')
url='http://ctwm.org/'
license=('custom:MIT' 'custom:X')
depends=('glibc' 'libjpeg-turbo' 'libxmu' 'libxpm')
makedepends=('imake' 'setconf')
backup=('etc/X11/ctwm/system.ctwmrc')
source=("http://ctwm.org/dist/$pkgname-$pkgver.tar.xz"
        "Imakefile.local"
        "copyright")
sha256sums=('574d67a8a69f2f1ebaa71aa40cc50667e814f74b51f5db8886e2def6a3e0900f'
            'ba8b25071ba0cdf03299dd827296b0fd8a6e549dac6f1ce8d50d9f26afd17041'
            '5242dcee1ffc736abd3e7022648c51039da7f4d998a2eb1eaee57367816886c1')

prepare() {
  cd "$pkgname-$pkgver"
  setconf Imakefile CONFDIR /etc/X11/ctwm
  setconf Imakefile PIXMAPDIR /etc/X11/ctwm/images
  cp ../Imakefile.local .
  xmkmf
}

build() {
  make -C "$pkgname-$pkgver"
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install install.man
  install -Dm644 "copyright" "$pkgdir/usr/share/licenses/ctwm/copyright"
}

# vim:set ts=2 sw=2 et:
