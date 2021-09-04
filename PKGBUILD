# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-session-standalone-git
pkgver=2.3.0.r42.gb83ff2b
pkgrel=1
pkgdesc='Session indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-session'
license=('GPL2')
groups=('pantheon-unstable')
depends=('accountsservice' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         lib{{granite,wingpanel}.so,handy})
makedepends=('git' 'gobject-introspection' 'granite' 'meson' 'vala'
             'wingpanel')
provides=('wingpanel-indicator-session')
conflicts=('wingpanel-indicator-session')
source=('git+https://github.com/elementary/wingpanel-indicator-session.git'
        'wingpanel-indicator-session-standalone-01-shutdown.patch')
sha256sums=('SKIP'
            'ca09d91061c301a12cae9e33f958cced8c6e4ee1d14dca4c239c8015191f73eb')

pkgver() {
  cd wingpanel-indicator-session
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd wingpanel-indicator-session
  patch -Np1 < ../wingpanel-indicator-session-standalone-01-shutdown.patch
}

build() {
  arch-meson wingpanel-indicator-session build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
