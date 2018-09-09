# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=spacefm-ng
pkgver=1.0.6
pkgrel=3
pkgdesc='A fork of spacefm multi-panel tabbed file manager'
arch=('i686' 'x86_64')
url='https://github.com/Teklad/spacefm-ng'
license=('GPL3')
depends=('gtk3' 'desktop-file-utils' 'startup-notification' 'ffmpegthumbnailer')
makedepends=('intltool' 'gettext')
optdepends=('lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks2: mount as non-root user')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Teklad/$pkgname/archive/$pkgver.tar.gz" suppress_warnings.patch)
md5sums=('01f45b00f61ec346b53668bdeb08e1f1'
         '02027f4d447ff2318afbce87490df382')
provides=('spacefm')
conflicts=('spacefm')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/suppress_warnings.patch
}

build() {
  cd $pkgname-$pkgver
  CPPFLAGS="" ./autogen.sh --with-gtk3 --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/bin/spacefm-installer
}



