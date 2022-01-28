# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=adwm
pkgver=0.7.16
pkgrel=1
pkgdesc="Advanced dynamic window manager for X"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/$pkgname"
license=('GPL')
depends=('libxft' 'libxrandr' 'libxinerama' 'libxpm' 'startup-notification' 'libxcomposite' 'libxdamage' 'libjpeg-turbo' 'libsvg-cairo')
optdepends=('xdg-launch: for application launching key bindings'
            'xde-ctools: for xde-run, xde-winmenu, xde-winlist and xde-wkspmenu default bindings'
            'xde-menu: for xde-menu root menu default bindings'
            'xde-session: for xde-logout and xde-xlock default bindings')
options=('!libtool')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
sha512sums=('7152a189ed1ad9fdafefff80b2e1be4ac1343eca173999871961c44e7ed923fa61b73ee85bd8ab35ddd2476d5a47282a46a8b7735968ace31e2d6f210336c8b3')

build() {
  cd $pkgname-$pkgver
  ./configure
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
