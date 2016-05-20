# Maintainer: Sergey Shatunov <me@prok.pw>
# Author: tista500

pkgname=adapta-themes-git
pkgver=3.21.1.204.r7.g679fb99
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines (GTK3, GTK2, Gnome Shell)'
arch=('any')
url='https://github.com/tista500/Adapta'
license=('GPL3')
depends=('gtk-engines' 'gtk-engine-murrine')
makedepends=('git')
provides=('adapta-themes')
conflicts=('adapta-themes')
source=($pkgname::git+https://github.com/tista500/Adapta.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  ./autogen.sh --prefix=/usr --with-gnome=${_gnomever}	
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  
  install -d "$pkgdir/usr/share/themes/Adapta/chrome"
  cp -r chrome/* $pkgdir/usr/share/themes/Adapta/chrome
}
